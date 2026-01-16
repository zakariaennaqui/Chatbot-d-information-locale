from model import build_model
from utils import load_data

x_train, y_train, x_test, y_test = load_data()
model = build_model()

model.summary()

model.fit(
    x_train, y_train,
    epochs=5,
    validation_split=0.1
)

model.save("saved_model/mnist_cnn.keras")
