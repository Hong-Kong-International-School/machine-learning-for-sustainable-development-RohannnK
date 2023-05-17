import numpy as np
import tensorflow as tf
import os
import cv2
from PIL import Image
from keras.models import Model
from keras.layers import Dense, Flatten
from keras.preprocessing.image import ImageDataGenerator
from keras.models import load_model
# tensorflow-metal = 0.5.0, tensorflow-macos = 2.9
my_new_model = load_model('/Users/rohankaman/Desktop/PlantDiseaseModel-v1.h5', compile = False)
test_image = tf.keras.utils.image.load('/Users/rohankaman/Desktop/Plant Dataset/test/test/AppleCedarRust4.JPG')
result = my_new_model.predict(test_image)
print(result)
