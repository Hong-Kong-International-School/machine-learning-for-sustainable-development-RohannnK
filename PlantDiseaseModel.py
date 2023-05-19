import numpy as np
import tensorflow as tf
import keras
import os
import cv2
from keras.models import Model
from keras.layers import Dense, Flatten
from keras.preprocessing.image import ImageDataGenerator
from keras.models import load_model
# tensorflow-metal = 0.5.0, tensorflow-macos = 2.9
WEIGHTS_PATH = 'PlantDiseaseModel-v1.h5'
plant_model = tf.keras.models.load_model(WEIGHTS_PATH, compile = False)
plant_model.compile(loss= tf.keras.losses.CategoricalCrossentropy(),
    optimizer= tf.keras.optimizers.Adam(learning_rate=0.001),
    metrics= ['accuracy'])
