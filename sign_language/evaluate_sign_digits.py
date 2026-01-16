import tensorflow as tf
from utils import load_data

model = tf.keras.models.load_model("saved_model/sign_digits_cnn.keras")
test_ds = load_data("data/test")

loss, acc = model.evaluate(test_ds)
print("Test accuracy:", acc)
