import tkinter as tk
from tkinter import scrolledtext, messagebox
from chatbot import ChatbotAssistant
import database as db

# --- TRAIN AI model first time ---
TRAIN = True
print("🤖 Initialisation du Chatbot Dynamique...")
assistant = ChatbotAssistant("intents.json")
print("Chargement des intents et données de la base...")
assistant.parse_intents()
assistant.prepare_data()

if TRAIN:
    assistant.train_model(epochs=150)
    TRAIN = False

print("Chatbot prêt!")


# -------------------------------------------------
# CHATBOT WINDOW
# -------------------------------------------------
def start_chatbot(user_id):
    root = tk.Tk()
    root.title("🤖 Chatbot Info Dynamique")
    root.geometry("700x600")
    root.configure(bg='#f0f0f0')

    # Frame principal
    main_frame = tk.Frame(root, bg='#f0f0f0')
    main_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

    # Zone de chat
    chat_label = tk.Label(main_frame, text="💬 Conversation", font=("Arial", 12, "bold"), bg='#f0f0f0')
    chat_label.pack(anchor='w')

    chat_area = scrolledtext.ScrolledText(main_frame, state='disabled', width=80, height=15,
                                          wrap=tk.WORD, font=("Arial", 10))
    chat_area.pack(pady=5, fill=tk.BOTH, expand=True)

    # Afficher message de bienvenue
    chat_area.configure(state='normal')
    chat_area.insert(tk.END, "🤖 Bot: Bonjour! Je peux vous renseigner sur:\n")
    chat_area.insert(tk.END, "   📅 Événements (concerts, marchés, etc.)\n")
    chat_area.insert(tk.END, "   🏛️ Services municipaux\n")
    chat_area.insert(tk.END, "   🚌 Transports (bus, lignes, horaires)\n")
    chat_area.insert(tk.END, "Posez-moi vos questions!\n\n")
    chat_area.configure(state='disabled')

    # Frame pour l'entrée
    input_frame = tk.Frame(main_frame, bg='#f0f0f0')
    input_frame.pack(fill=tk.X, pady=5)

    entry_box = tk.Entry(input_frame, width=60, font=("Arial", 11))
    entry_box.pack(side=tk.LEFT, padx=5, fill=tk.X, expand=True)

    def send_message(event=None):
        user_msg = entry_box.get()
        if not user_msg.strip():
            return

        chat_area.configure(state='normal')
        chat_area.insert(tk.END, f"👤 Vous: {user_msg}\n", "user")
        entry_box.delete(0, tk.END)

        # Prédire l'intent
        intent = assistant.predict_intent(user_msg)
        print(f"Intent détecté: {intent}")

        # Obtenir la réponse
        bot_reply = assistant.get_response(intent, user_msg)

        # Sauvegarder dans la DB
        db.save_message(user_id, user_msg, bot_reply)

        chat_area.insert(tk.END, f"🤖 Bot: {bot_reply}\n\n", "bot")
        chat_area.configure(state='disabled')
        chat_area.see(tk.END)

        return "break"  # Empêche le comportement par défaut

    send_button = tk.Button(input_frame, text="Envoyer", command=send_message,
                            bg='#4CAF50', fg='white', font=("Arial", 10, "bold"),
                            padx=15, pady=5, cursor="hand2")
    send_button.pack(side=tk.LEFT, padx=5)

    # Bind Enter key
    entry_box.bind('<Return>', send_message)

    # --- Panel historique récent ---
    history_label = tk.Label(main_frame, text="Historique récent", font=("Arial", 11, "bold"), bg='#f0f0f0')
    history_label.pack(anchor='w', pady=(10, 0))

    recent_msgs = scrolledtext.ScrolledText(main_frame, state='disabled', width=80, height=8,
                                            wrap=tk.WORD, font=("Arial", 9), bg='#fafafa')
    recent_msgs.pack(pady=5)

    messages = db.get_recent_messages(user_id, limit=5)
    recent_msgs.configure(state='normal')
    for msg in reversed(messages):
        recent_msgs.insert(tk.END, f"👤 Vous: {msg['message']}\n")
        recent_msgs.insert(tk.END, f"🤖 Bot: {msg['response']}\n")
        recent_msgs.insert(tk.END, f"    {msg['timestamp']}\n\n")
    recent_msgs.configure(state='disabled')

    # Tags pour les couleurs
    chat_area.tag_config("user", foreground="#0066cc")
    chat_area.tag_config("bot", foreground="#009900")

    root.mainloop()


# -------------------------------------------------
# LOGIN WINDOW
# -------------------------------------------------
login_win = tk.Tk()
login_win.title("Connexion - Chatbot")
login_win.geometry("450x300")
login_win.configure(bg='#e8f4f8')

# Titre
title_label = tk.Label(login_win, text="🤖 Chatbot Info Dynamique",
                       font=("Arial", 16, "bold"), bg='#e8f4f8', fg='#0066cc')
title_label.pack(pady=20)

# Frame pour les champs
form_frame = tk.Frame(login_win, bg='#e8f4f8')
form_frame.pack(pady=10)

tk.Label(form_frame, text="👤 Nom d'utilisateur:", font=("Arial", 10), bg='#e8f4f8').grid(row=0, column=0, sticky='w',
                                                                                         pady=5)
username_entry = tk.Entry(form_frame, width=30, font=("Arial", 10))
username_entry.grid(row=0, column=1, pady=5, padx=10)

tk.Label(form_frame, text="Mot de passe:", font=("Arial", 10), bg='#e8f4f8').grid(row=1, column=0, sticky='w', pady=5)
password_entry = tk.Entry(form_frame, show="*", width=30, font=("Arial", 10))
password_entry.grid(row=1, column=1, pady=5, padx=10)


def login():
    username = username_entry.get()
    password = password_entry.get()

    if not username or not password:
        messagebox.showwarning("Attention", "Veuillez remplir tous les champs")
        return

    user = db.login_user(username, password)
    if user:
        login_win.destroy()
        start_chatbot(user['id'])
    else:
        messagebox.showerror("Erreur", "Identifiants incorrects")


def register():
    reg_win = tk.Toplevel(login_win)
    reg_win.title("Créer un compte")
    reg_win.geometry("450x350")
    reg_win.configure(bg='#f0f8ff')

    tk.Label(reg_win, text="Inscription", font=("Arial", 14, "bold"),
             bg='#f0f8ff', fg='#0066cc').pack(pady=15)

    reg_frame = tk.Frame(reg_win, bg='#f0f8ff')
    reg_frame.pack(pady=10)

    tk.Label(reg_frame, text="👤 Nom d'utilisateur:", font=("Arial", 10), bg='#f0f8ff').grid(row=0, column=0, sticky='w',
                                                                                            pady=5)
    r_user = tk.Entry(reg_frame, width=30, font=("Arial", 10))
    r_user.grid(row=0, column=1, pady=5, padx=10)

    tk.Label(reg_frame, text="Email:", font=("Arial", 10), bg='#f0f8ff').grid(row=1, column=0, sticky='w', pady=5)
    r_email = tk.Entry(reg_frame, width=30, font=("Arial", 10))
    r_email.grid(row=1, column=1, pady=5, padx=10)

    tk.Label(reg_frame, text="Mot de passe:", font=("Arial", 10), bg='#f0f8ff').grid(row=2, column=0, sticky='w',
                                                                                       pady=5)
    r_pass = tk.Entry(reg_frame, show="*", width=30, font=("Arial", 10))
    r_pass.grid(row=2, column=1, pady=5, padx=10)

    def submit_register():
        if not r_user.get() or not r_email.get() or not r_pass.get():
            messagebox.showwarning("Attention", "Veuillez remplir tous les champs")
            return
        try:
            db.register_user(r_user.get(), r_email.get(), r_pass.get())
            messagebox.showinfo("Succès", "Compte créé avec succès!")
            reg_win.destroy()
        except Exception as e:
            messagebox.showerror("Erreur", f"Impossible de créer le compte: {str(e)}")

    tk.Button(reg_frame, text="Créer le compte", command=submit_register,
              bg='#4CAF50', fg='white', font=("Arial", 11, "bold"),
              padx=20, pady=8, cursor="hand2").grid(row=3, column=0, columnspan=2, pady=20)


# Boutons
btn_frame = tk.Frame(login_win, bg='#e8f4f8')
btn_frame.pack(pady=20)

tk.Button(btn_frame, text="Se connecter", command=login,
          bg='#4CAF50', fg='white', font=("Arial", 11, "bold"),
          width=15, pady=8, cursor="hand2").pack(pady=5)

tk.Button(btn_frame, text="S'inscrire", command=register,
          bg='#2196F3', fg='white', font=("Arial", 11, "bold"),
          width=15, pady=8, cursor="hand2").pack(pady=5)

# Bind Enter pour login
password_entry.bind('<Return>', lambda e: login())

login_win.mainloop()
