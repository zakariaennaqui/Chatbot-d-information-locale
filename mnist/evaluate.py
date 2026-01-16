from tensorflow.keras.models import load_model
from data_loader import load_data
from config import MODEL_PATH

def evaluate():
    _, (x_test, y_test) = load_data()
    model = load_model(MODEL_PATH)

    loss, accuracy = model.evaluate(x_test, y_test)
    print(f"Test accuracy : {accuracy:.4f}")
    print(f"Test loss : {loss:.4f}")

if __name__ == "__main__":
    evaluate()
