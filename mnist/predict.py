import numpy as np
import matplotlib.pyplot as plt
from tensorflow.keras.models import load_model
from data_loader import load_data
from config import MODEL_PATH

def predict(index=0):
    _, (x_test, y_test) = load_data()
    model = load_model(MODEL_PATH)

    image = x_test[index]
    prediction = model.predict(image.reshape(1, 28, 28, 1))
    predicted_label = np.argmax(prediction)

    plt.imshow(image.reshape(28,28), cmap='gray')
    plt.title(f"Prediction: {predicted_label} | True: {y_test[index]}")
    plt.show()

if __name__ == "__main__":
    predict(10)
