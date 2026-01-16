from model import build_model
from utils import load_data

train_ds = load_data("data/train")
test_ds = load_data("data/test")

model = build_model()
model.summary()

model.fit(
    train_ds,
    epochs=10,
    validation_data=test_ds
)

model.save("saved_model/sign_digits_cnn.keras")
