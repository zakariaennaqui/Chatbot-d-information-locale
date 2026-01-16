import tensorflow as tf
import numpy as np
import cv2
import matplotlib.pyplot as plt

# Load saved model
model = tf.keras.models.load_model("mnist_cnn.h5")

# Load and preprocess digit.jpg
img = cv2.imread("digit.png", cv2.IMREAD_GRAYSCALE)
img = cv2.resize(img, (28, 28))
img = 255 - img
img = img / 255.0
img = img.reshape(1, 28, 28, 1)

# Show image
plt.imshow(img.reshape(28,28), cmap='gray')
plt.axis('off')
plt.show()

# Predict
prediction = model.predict(img)
print("Recognized digit:", np.argmax(prediction))




















# import tensorflow as tf
# import numpy as np
# import cv2
# import matplotlib.pyplot as plt
#
# # =============================
# # Load trained model
# # =============================
# model = tf.keras.models.load_model("mnist_cnn.h5")
#
# # =============================
# # Load image
# # =============================
# img = cv2.imread("digit.jpg", cv2.IMREAD_GRAYSCALE)
#
# # =============================
# # Preprocessing (MNIST-style)
# # =============================
#
# # Reduce noise
# img = cv2.GaussianBlur(img, (5, 5), 0)
#
# # Adaptive threshold (better than fixed threshold)
# img = cv2.adaptiveThreshold(
#     img,
#     255,
#     cv2.ADAPTIVE_THRESH_GAUSSIAN_C,
#     cv2.THRESH_BINARY,
#     11,
#     2
# )
#
# # Invert colors (white digit on black)
# img = 255 - img
#
# # Thicken digit (important for 6)
# kernel = np.ones((2, 2), np.uint8)
# img = cv2.dilate(img, kernel, iterations=1)
#
# # Crop digit area
# coords = cv2.findNonZero(img)
# x, y, w, h = cv2.boundingRect(coords)
# img = img[y:y+h, x:x+w]
#
# # Resize to MNIST size
# img = cv2.resize(img, (28, 28), interpolation=cv2.INTER_AREA)
#
# # Normalize
# img = img.astype("float32") / 255.0
#
# # Reshape for CNN
# img = img.reshape(1, 28, 28, 1)
#
# # =============================
# # Display processed image
# # =============================
# plt.imshow(img.reshape(28, 28), cmap="gray")
# plt.title("Processed Input")
# plt.axis("off")
# plt.show()
#
# # =============================
# # Prediction
# # =============================
# prediction = model.predict(img, verbose=0)
# digit = np.argmax(prediction)
# confidence = np.max(prediction)
#
# # =============================
# # Output
# # =============================
# if confidence < 0.8:
#     print("⚠️ Prediction uncertain")
# else:
#     print(f"✅ Recognized digit: {digit}")
#
# print(f"Confidence: {confidence:.2f}")
#
# print("\nDigit probabilities:")
# for i, p in enumerate(prediction[0]):
#     print(f"{i}: {p:.4f}")
