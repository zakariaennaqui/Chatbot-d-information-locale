import tensorflow as tf
from tensorflow.keras import datasets, layers, models
import matplotlib.pyplot as plt
import numpy as np

# 1. Charger MNIST
(x_train, y_train), (x_test, y_test) = datasets.mnist.load_data()

# 2. Normalisation
x_train = x_train / 255.0
x_test = x_test / 255.0

# 3. Reshape
x_train = x_train.reshape(-1, 28, 28, 1)
x_test = x_test.reshape(-1, 28, 28, 1)

# 4. Construire le CNN
model = models.Sequential([
    layers.Conv2D(32, (3,3), activation='relu', input_shape=(28,28,1)),
    layers.MaxPooling2D((2,2)),
    layers.Conv2D(64, (3,3), activation='relu'),
    layers.MaxPooling2D((2,2)),
    layers.Flatten(),
    layers.Dense(64, activation='relu'),
    layers.Dense(10, activation='softmax')
])

# 5. Compiler
model.compile(
    optimizer='adam',
    loss='sparse_categorical_crossentropy',
    metrics=['accuracy']
)

# 6. Entraîner
model.fit(x_train, y_train, epochs=5, validation_split=0.1)

# 7. Évaluer
model.evaluate(x_test, y_test)

# 8. Tester une image
index = 10
image = x_test[index]

plt.imshow(image.reshape(28,28), cmap='gray')
plt.title("Image test")
plt.show()

prediction = model.predict(image.reshape(1,28,28,1))
print("Chiffre reconnu :", np.argmax(prediction))
