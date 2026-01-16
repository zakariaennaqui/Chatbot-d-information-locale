from tensorflow.keras.optimizers import Adam
from data_loader import load_data
from mod import build_model
from config import EPOCHS, BATCH_SIZE, LEARNING_RATE, MODEL_PATH

def train():
    (x_train, y_train), _ = load_data()

    model = build_model()

    model.compile(
        optimizer=Adam(learning_rate=LEARNING_RATE),
        loss='sparse_categorical_crossentropy',
        metrics=['accuracy']
    )

    model.fit(
        x_train,
        y_train,
        epochs=EPOCHS,
        batch_size=BATCH_SIZE,
        validation_split=0.1
    )

    model.save(MODEL_PATH)
    print(" Modèle sauvegardé :", MODEL_PATH)

if __name__ == "__main__":
    train()
