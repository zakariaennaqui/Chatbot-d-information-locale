import tensorflow as tf
from tensorflow.keras import layers, models
import matplotlib.pyplot as plt
import numpy as np

# 1. Load MNIST
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()

# 2. Normalize
x_train = x_train / 255.0
x_test = x_test / 255.0

# 3. Reshape for CNN
x_train = x_train.reshape(-1, 28, 28, 1)
x_test = x_test.reshape(-1, 28, 28, 1)

# 4. CNN Model
model = models.Sequential([
    layers.Conv2D(32, (3,3), activation='relu', input_shape=(28,28,1)),
    layers.MaxPooling2D((2,2)),
    layers.Conv2D(64, (3,3), activation='relu'),
    layers.MaxPooling2D((2,2)),
    layers.Flatten(),
    layers.Dense(128, activation='relu'),
    layers.Dense(10, activation='softmax')
])

# 5. Compile
model.compile(
    optimizer='adam',
    loss='sparse_categorical_crossentropy',
    metrics=['accuracy']
)

# 6. Train
model.fit(x_train, y_train, epochs=5, validation_split=0.1)

# 7. Test accuracy
test_loss, test_acc = model.evaluate(x_test, y_test)
print("Test accuracy:", test_acc)

# 8. Test one image
index = 7
image = x_test[index]

plt.imshow(image.reshape(28,28), cmap='gray')
plt.title("Real number")
plt.axis('off')
plt.show()

prediction = model.predict(image.reshape(1,28,28,1))
print("Predicted number:", np.argmax(prediction))
print("Real number:", y_test[index])

import cv2

img = cv2.imread("digit.jpg", cv2.IMREAD_GRAYSCALE)
img = cv2.resize(img, (28,28))
img = 255 - img
img = img / 255.0

plt.imshow(img, cmap='gray')
plt.axis('off')
plt.show()

prediction = model.predict(img.reshape(1,28,28,1))
print("Recognized digit:", np.argmax(prediction))
