import numpy as np
import tensorflow as tf
import os
import cv2
from sklearn.model_selection import train_test_split
from tensorflow.keras.applications.resnet50 import ResNet50
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.python.keras.preprocessing.image import ImageDataGenerator
import pathlib
import pandas as pd
# tensorflow-metal = 0.5.0, tensorflow-macos = 2.9
