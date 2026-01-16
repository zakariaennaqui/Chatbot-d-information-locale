import mysql.connector
import unicodedata

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="chatbot"
)

cursor = db.cursor(dictionary=True)


# --- Normalisation des textes ---
def normalize_text(text):
    """Normalise le texte: minuscules, sans accents, sans espaces multiples"""
    if not text:
        return ""
    # Convertir en minuscules
    text = text.lower()
    # Supprimer les accents
    text = ''.join(
        c for c in unicodedata.normalize('NFD', text)
        if unicodedata.category(c) != 'Mn'
    )
    # Supprimer espaces multiples et trim
    text = ' '.join(text.split())
    return text


# --- User login & registration ---
def register_user(username, email, password):
    cursor.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                   (username, email, password))
    db.commit()


def login_user(username, password):
    cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
    return cursor.fetchone()


# --- Chat history ---
def save_message(user_id, message, response):
    cursor.execute(
        "INSERT INTO messages (user_id, message, response) VALUES (%s, %s, %s)",
        (user_id, message, response)
    )
    db.commit()


def get_recent_messages(user_id, limit=10):
    cursor.execute(
        "SELECT message, response, timestamp FROM messages WHERE user_id=%s ORDER BY timestamp DESC LIMIT %s",
        (user_id, limit)
    )
    return cursor.fetchall()


# --- Dynamic data extraction pour training ---
def get_all_training_data():
    """Récupère toutes les données des tables pour générer les patterns d'entraînement"""
    training_data = {
        'evenements': [],
        'services_municipaux': [],
        'transports': []
    }

    # Table: evenements - mots clés: nom
    cursor.execute("SELECT * FROM evenements")
    events = cursor.fetchall()
    for event in events:
        training_data['evenements'].append({
            'keywords': [event['nom']],
            'data': event
        })

    # Table: services_municipaux - mots clés: nom
    cursor.execute("SELECT * FROM services_municipaux")
    services = cursor.fetchall()
    for service in services:
        training_data['services_municipaux'].append({
            'keywords': [service['nom']],
            'data': service
        })

    # Table: transports - mots clés: ligne, type, destination
    cursor.execute("SELECT * FROM transports")
    transports = cursor.fetchall()
    for transport in transports:
        keywords = [transport['ligne']]
        if transport.get('type'):
            keywords.append(transport['type'])
        if transport.get('destination'):
            keywords.append(transport['destination'])
        training_data['transports'].append({
            'keywords': keywords,
            'data': transport
        })

    return training_data


# --- Recherche dynamique dans les tables ---
def search_in_table(table_name, user_input):
    """Recherche dans une table spécifique basée sur l'input normalisé"""
    normalized_input = normalize_text(user_input)

    if table_name == 'evenements':
        cursor.execute("SELECT * FROM evenements")
        results = cursor.fetchall()
        matched = []
        for row in results:
            if normalize_text(row['nom']) in normalized_input or normalized_input in normalize_text(row['nom']):
                matched.append(row)
        return matched

    elif table_name == 'services_municipaux':
        cursor.execute("SELECT * FROM services_municipaux")
        results = cursor.fetchall()
        matched = []
        for row in results:
            if normalize_text(row['nom']) in normalized_input or normalized_input in normalize_text(row['nom']):
                matched.append(row)
        return matched

    elif table_name == 'transports':
        cursor.execute("SELECT * FROM transports")
        results = cursor.fetchall()
        matched = []
        for row in results:
            # Chercher dans ligne, type, destination
            search_fields = [
                normalize_text(str(row.get('ligne', ''))),
                normalize_text(str(row.get('type', ''))),
                normalize_text(str(row.get('destination', '')))
            ]
            if any(field in normalized_input or normalized_input in field for field in search_fields if field):
                matched.append(row)
        return matched

    return []


# --- Détection automatique de la table concernée ---
def detect_table_intent(user_input):
    """Détecte quelle table est concernée par l'input utilisateur"""
    normalized = normalize_text(user_input)

    # Mots-clés génériques pour chaque table
    event_keywords = ['evenement', 'event', 'concert', 'marche', 'activite', 'fete']
    service_keywords = ['service', 'mairie', 'collecte', 'dechet']
    transport_keywords = ['bus', 'transport', 'ligne', 'taxi', 'horaire', 'trajet']

    # Chercher si l'input correspond à des données existantes
    training_data = get_all_training_data()

    # Vérifier d'abord si l'input correspond directement à des données
    for event in training_data['evenements']:
        for keyword in event['keywords']:
            if normalize_text(keyword) in normalized or normalized in normalize_text(keyword):
                return 'evenements'

    for service in training_data['services_municipaux']:
        for keyword in service['keywords']:
            if normalize_text(keyword) in normalized or normalized in normalize_text(keyword):
                return 'services_municipaux'

    for transport in training_data['transports']:
        for keyword in transport['keywords']:
            if normalize_text(keyword) in normalized or normalized in normalize_text(keyword):
                return 'transports'

    # Si pas de correspondance directe, utiliser les mots-clés génériques
    if any(kw in normalized for kw in event_keywords):
        return 'evenements'
    elif any(kw in normalized for kw in service_keywords):
        return 'services_municipaux'
    elif any(kw in normalized for kw in transport_keywords):
        return 'transports'

    return None


# --- Formatage des résultats ---
def format_evenements_results(results):
    if not results:
        return "Aucun événement trouvé."

    output = []
    for event in results:
        output.append(f"📅 {event['nom']}: {event['description']} à {event['lieu']} le {event['date']}")
    return "\n".join(output)


def format_services_results(results):
    if not results:
        return "Aucun service trouvé."

    output = []
    for service in results:
        info = f"🏛️ {service['nom']}\n"
        info += f"   Horaires: {service['horaires']}\n"
        info += f"   Adresse: {service['adresse']}\n"
        info += f"   Téléphone: {service['telephone']}"
        if service['description']:
            info += f"\n   Description: {service['description']}"
        output.append(info)
    return "\n\n".join(output)


def format_transports_results(results):
    if not results:
        return "Aucun transport trouvé."

    output = []
    for transport in results:
        info = f"🚌 Ligne {transport['ligne']}"
        if transport.get('type'):
            info += f" ({transport['type']})"
        info += f"\n   Horaires: {transport['horaires']}"
        info += f"\n   Tarif: {transport['tarif']}"
        if transport.get('destination'):
            info += f"\n   Destination: {transport['destination']}"
        if transport.get('etat_trafic'):
            info += f"\n   État: {transport['etat_trafic']}"
        output.append(info)
    return "\n\n".join(output)