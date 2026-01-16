import tensorflow as tf
from tensorflow.keras import datasets
import numpy as np
from config import IMAGE_HEIGHT, IMAGE_WIDTH, CHANNELS

def load_data():
    (x_train, y_train), (x_test, y_test) = datasets.mnist.load_data()

    # Normalisation
    x_train = x_train / 255.0
    x_test = x_test / 255.0

    # Reshape pour CNN
    x_train = x_train.reshape(-1, IMAGE_HEIGHT, IMAGE_WIDTH, CHANNELS)
    x_test = x_test.reshape(-1, IMAGE_HEIGHT, IMAGE_WIDTH, CHANNELS)

    return (x_train, y_train), (x_test, y_test)
