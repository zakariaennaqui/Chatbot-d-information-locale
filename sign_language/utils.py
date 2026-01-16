import tensorflow as tf

def load_data(path):
    return tf.keras.preprocessing.image_dataset_from_directory(
        path,
        image_size=(64, 64),
        batch_size=32,
        label_mode='int'
    )
