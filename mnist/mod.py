from tensorflow.keras import layers, models
from config import IMAGE_HEIGHT, IMAGE_WIDTH, CHANNELS, NUM_CLASSES

def build_model():
    model = models.Sequential([
        layers.Input(shape=(IMAGE_HEIGHT, IMAGE_WIDTH, CHANNELS)),

        layers.Conv2D(32, (3, 3), activation='relu'),
        layers.MaxPooling2D((2, 2)),

        layers.Conv2D(64, (3, 3), activation='relu'),
        layers.MaxPooling2D((2, 2)),

        layers.Flatten(),
        layers.Dense(64, activation='relu'),
        layers.Dense(NUM_CLASSES, activation='softmax')
    ])

    return model
