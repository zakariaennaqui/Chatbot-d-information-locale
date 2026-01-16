import tensorflow as tf
from utils import load_data

model = tf.keras.models.load_model("saved_model/mnist_cnn.keras")
_, _, x_test, y_test = load_data()

loss, acc = model.evaluate(x_test, y_test)
print("Test accuracy:", acc)
