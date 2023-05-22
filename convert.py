import tensorflow as tf
import coremltools as ct

plant_model2 = tf.keras.models.load_model('PlantDiseaseModel-v1.h5', compile = False)

ml_model = ct.convert(plant_model2, source = 'tensorflow', convert_to="mlprogram")

if ml_model.get_spec().description.input:
    input_shape = ml_model.get_spec().description.input[0].type.multiArrayType.shape
    input_type = ml_model.get_spec().description.input[0].type.multiArrayType.dataType
    print(f"Input shape: {input_shape}")
    print(f"Input type: {input_type}")
else:
    print("Model has no input description.")

ml_model.save('/Users/rohankaman/Documents/GitHub/machine-learning-for-sustainable-development-RohannnK/coreml_model.mlpackage')