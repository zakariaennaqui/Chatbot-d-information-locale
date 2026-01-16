import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Load MNIST data
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
x_test = x_test.astype('float32') / 255.0
x_test = np.expand_dims(x_test, -1)  # Add channel dimension

# Load trained model (adjust path if needed)
model = tf.keras.models.load_model('saved_model/mnist_cnn.keras')

# Evaluate on test set
loss, accuracy = model.evaluate(x_test, y_test, verbose=0)
print(f"Test accuracy: {accuracy:.4f}")
print(f"Test loss: {loss:.4f}")

# Predict on test set
predictions = model.predict(x_test)
pred_labels = np.argmax(predictions, axis=1)

# Select 25 random images
indices = np.random.choice(len(x_test), size=25, replace=False)
sample_images = x_test[indices]
sample_true = y_test[indices]
sample_pred = pred_labels[indices]

# Plot results
plt.figure(figsize=(12, 12))
for i in range(25):
    plt.subplot(5, 5, i+1)
    plt.imshow(sample_images[i].reshape(28, 28), cmap='gray')
    color = 'green' if sample_true[i] == sample_pred[i] else 'red'
    plt.title(f"Pred: {sample_pred[i]}\nTrue: {sample_true[i]}", color=color)
    plt.axis('off')
plt.tight_layout()
plt.show()
