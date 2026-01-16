import json
import random
import nltk
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
import database as db
from nltk.stem import WordNetLemmatizer

# Download NLTK data (first time)
try:
    nltk.download('punkt', quiet=True)
    nltk.download('wordnet', quiet=True)
except:
    pass


class ChatbotModel(nn.Module):
    def __init__(self, input_size, output_size):
        super().__init__()
        self.fc1 = nn.Linear(input_size, 128)
        self.fc2 = nn.Linear(128, 64)
        self.fc3 = nn.Linear(64, output_size)
        self.relu = nn.ReLU()
        self.dropout = nn.Dropout(0.5)

    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.dropout(x)
        x = self.relu(self.fc2(x))
        x = self.dropout(x)
        x = self.fc3(x)
        return x


class ChatbotAssistant:
    def __init__(self, intents_path):
        self.intents_path = intents_path
        self.documents = []
        self.vocabulary = []
        self.intents = []
        self.intents_responses = {}
        self.model = None
        self.X, self.y = None, None
        self.use_dynamic_db = True  # Flag pour utiliser la DB dynamique

    @staticmethod
    def tokenize_and_lemmatize(text):
        lemmatizer = WordNetLemmatizer()
        normalized = db.normalize_text(text)
        words = nltk.word_tokenize(normalized)
        return [lemmatizer.lemmatize(word.lower()) for word in words if word.isalnum()]

    def bag_of_words(self, words):
        return [1 if word in words else 0 for word in self.vocabulary]

    def parse_intents(self):
        """Parse les intents statiques + génère dynamiquement depuis la DB"""
        # 1. Charger les intents de base (greeting, goodbye)
        with open(self.intents_path, 'r', encoding='utf-8') as f:
            data = json.load(f)

        for intent in data['intents']:
            tag = intent['tag']
            # Seulement garder greeting et goodbye du fichier JSON
            if tag in ['greeting', 'goodbye']:
                self.intents.append(tag)
                self.intents_responses[tag] = intent['responses']
                for pattern in intent['patterns']:
                    tokens = self.tokenize_and_lemmatize(pattern)
                    self.vocabulary.extend(tokens)
                    self.documents.append((tokens, tag))

        # 2. Générer dynamiquement les intents depuis la base de données
        training_data = db.get_all_training_data()

        # Ajouter intent pour chaque table
        for table_name, items in training_data.items():
            if items:  # Si la table contient des données
                # Ajouter le nom de la table comme intent
                if table_name not in self.intents:
                    self.intents.append(table_name)
                    self.intents_responses[table_name] = [f"Recherche dans {table_name}..."]

                # Ajouter tous les mots-clés de cette table
                for item in items:
                    for keyword in item['keywords']:
                        if keyword:
                            # Générer des variations du mot-clé
                            patterns = self.generate_keyword_patterns(keyword)
                            for pattern in patterns:
                                tokens = self.tokenize_and_lemmatize(pattern)
                                if tokens:
                                    self.vocabulary.extend(tokens)
                                    self.documents.append((tokens, table_name))

        self.vocabulary = sorted(set(self.vocabulary))
        print(f"Vocabulaire généré: {len(self.vocabulary)} mots")
        print(f"Intents: {self.intents}")
        print(f"Documents d'entraînement: {len(self.documents)}")

    def generate_keyword_patterns(self, keyword):
        """Génère des variations d'un mot-clé pour l'entraînement"""
        patterns = [keyword]
        normalized = db.normalize_text(keyword)
        if normalized != keyword:
            patterns.append(normalized)
        # Ajouter variations avec/sans espaces
        patterns.append(keyword.replace(' ', ''))
        patterns.append(normalized.replace(' ', ''))
        return list(set(patterns))

    def prepare_data(self):
        bags, labels = [], []
        for doc in self.documents:
            bags.append(self.bag_of_words(doc[0]))
            labels.append(self.intents.index(doc[1]))
        self.X = np.array(bags)
        self.y = np.array(labels)
        print(f"Données préparées: X shape = {self.X.shape}, y shape = {self.y.shape}")

    def train_model(self, epochs=100, lr=0.001):
        if len(self.intents) == 0 or self.X is None:
            print("Pas de données pour l'entraînement!")
            return

        X_tensor = torch.tensor(self.X, dtype=torch.float32)
        y_tensor = torch.tensor(self.y, dtype=torch.long)

        dataset = torch.utils.data.TensorDataset(X_tensor, y_tensor)
        loader = torch.utils.data.DataLoader(dataset, batch_size=8, shuffle=True)

        self.model = ChatbotModel(self.X.shape[1], len(self.intents))
        optimizer = optim.Adam(self.model.parameters(), lr=lr)
        criterion = nn.CrossEntropyLoss()

        print(f"Début de l'entraînement du modèle ({epochs} epochs)...")
        for epoch in range(epochs):
            running_loss = 0.0
            for batch_X, batch_y in loader:
                optimizer.zero_grad()
                outputs = self.model(batch_X)
                loss = criterion(outputs, batch_y)
                loss.backward()
                optimizer.step()
                running_loss += loss
            if (epoch + 1) % 20 == 0:
                print(f"Epoch {epoch + 1}/{epochs} - Loss: {running_loss / len(loader):.4f}")
        print("Entraînement terminé!")

    def predict_intent(self, text):
        """Prédit l'intent avec le modèle OU détecte directement depuis la DB"""
        # D'abord essayer la détection directe dans la DB
        detected_table = db.detect_table_intent(text)
        if detected_table:
            return detected_table

        # Sinon utiliser le modèle ML
        words = self.tokenize_and_lemmatize(text)
        if not words:
            return 'greeting'

        bag = self.bag_of_words(words)
        self.model.eval()
        with torch.no_grad():
            output = self.model(torch.tensor([bag], dtype=torch.float32))
            index = torch.argmax(output, dim=1).item()
        return self.intents[index]

    def get_response(self, intent, user_input=""):
        """Retourne une réponse basée sur l'intent"""
        # Si c'est un intent de table, chercher dans la DB
        if intent in ['evenements', 'services_municipaux', 'transports']:
            results = db.search_in_table(intent, user_input)

            if intent == 'evenements':
                return db.format_evenements_results(results)
            elif intent == 'services_municipaux':
                return db.format_services_results(results)
            elif intent == 'transports':
                return db.format_transports_results(results)

        # Sinon réponse standard
        if intent in self.intents_responses:
            return random.choice(self.intents_responses[intent])

        return "Je ne suis pas sûr de comprendre. Pouvez-vous reformuler ?"