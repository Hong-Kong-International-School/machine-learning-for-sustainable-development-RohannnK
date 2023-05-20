import tensorflow as tf
import coremltools as ct

plant_model = tf.keras.models.load_model('PlantDiseaseModel-v1.h5', compile = False)

ml_model = ct.convert(plant_model, source = 'tensorflow', convert_to="mlprogram")
ml_model.save('/Users/rohankaman/Documents/GitHub/machine-learning-for-sustainable-development-RohannnK/coreml_model.mlpackage')