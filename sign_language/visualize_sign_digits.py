import tensorflow as tf
import matplotlib.pyplot as plt
import numpy as np

# --- 1️ Load model ---
model = tf.keras.models.load_model("saved_model/sign_digits_cnn.keras")

# --- 2️ Load test dataset ---
test_ds = tf.keras.preprocessing.image_dataset_from_directory(
    "data/test",
    image_size=(64, 64),
    batch_size=32,
    label_mode='int',
    shuffle=False
)

# --- 3️ Evaluate model ---
loss, accuracy = model.evaluate(test_ds)
print(f"Test accuracy: {accuracy:.4f}, Test loss: {loss:.4f}")

# --- 4️ Predict on all test images ---
y_true = []
y_pred = []
images_list = []

for images, labels in test_ds:
    preds = model.predict(images)
    y_true.extend(labels.numpy())
    y_pred.extend(np.argmax(preds, axis=1))
    images_list.extend(images.numpy())

y_true = np.array(y_true)
y_pred = np.array(y_pred)
images_list = np.array(images_list)

# --- 5️ Plot a grid of images with predictions ---
num_images = min(36, len(images_list))  # show up to 36 images
fig, axes = plt.subplots(6, 6, figsize=(12, 12))
axes = axes.flatten()

for i in range(num_images):
    ax = axes[i]
    img = images_list[i].astype("uint8")
    ax.imshow(img)
    title_color = "green" if y_true[i] == y_pred[i] else "red"
    ax.set_title(f"T:{y_true[i]} P:{y_pred[i]}", color=title_color)
    ax.axis("off")

# Hide unused axes if any
for j in range(num_images, len(axes)):
    axes[j].axis("off")

plt.tight_layout()
plt.show()
