import coremltools as ct
import tensorflow as tf

ml_model = ct.convert('PlantDiseaseModel-v1.h5', convert_to="mlprogram")
