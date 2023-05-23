# ABOUT THE PROJECT

In this project, I will create an app that addresses SDG number 2: Zero Hunger. Right now, there are 828 million people who go to sleep on an empty stomach every night. Even more shocking, around 2.3 billion people face some level of food insecurity on a daily basis. This is all despite the fact that there is more than enough food for everyone. This is due to a wide variety of reasons, but one of them is crop disease. An estimated 14.1% of all crops grown for human consumption perish annualy as a result of crop disease. A lot of the time, crops succumb to disease due to farmers not being able to identify which crops are suffering from what disease. Thus, in order to help combat this, this app, powered by a neural network based on Resnet, can identify 38 different types of plant/crop disease simply by taking a photo of the plant.


Dataset: https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset

Model Trained on Kaggle Here: https://www.kaggle.com/code/rohankaman12/neural-network-for-plant-disease/notebook

# HOW TO USE

## Step 1: Download the Project


## Step 2: Run the Xcode project files in Xcode

Make sure your Xcode version is updated enough to run/utilise neural networks. Xcode 14 and above should be sufficient.


## Step 3: Connect an Apple Device and Grant Permissions

Connect an iPhone or iPad to your computer via USB cable. This may depend on the version of Xcode you have and your iOS version. You also may need to grant permissions on your phone and computer.


## Step 4: Run the Project

Press the run button and wait for the app to launch on your connected device. Once launched, click the "Take Photo" button to take a photo of the plant and the app will classify what disease it has.


# DEVELOPMENT OVERVIEW

## Design Process

### Model Training and Performance

Using the dataset linked above, the neural network model was trained on Kaggle as the dataset was on Kaggle. The model is based on Resnet50 transfer learning and achieved an accuracy and validation accuracy of 96.25% and 94.99% respectively. The full results can be seen in the Kaggle link posted prior. However, overall I am satisfied with the performance of the model as I think the accuracy and validation accuracy are quite high. 

### Model Saving and Converting to CoreML

After the model was trained, I saved the weights and architecture as a .h5 file and downloaded it from Kaggle. Then, I uploaded it to Visual Studio Code and converted it to Apple's CoreML format as Xcode requires my model to be in Apple's format. In order to be able to do this, I created a Conda Virtual Environment.

### App Development

After converting the model to CoreML, I loaded it into Xcode and created the app's basic architecture. Due to time constraints, I wasn't able to fully develop the app's UI, but part of the base functionality exists, which I will elaborate on later.

# WORKING PROJECT (INCOMPLETE)

[Here is a link to a video of my work in progress](https://youtube.com/shorts/wAyegYnMT98)


Right now, my project isn't working since I'm having issues loading my model. Currently, I suspect that the model file may be corrupted or is being accessed incorrectly. However, as of now, the camera component works and the model works separately (the latter can be seen in Kaggle), but they don't work together.


# FUTURE WORK

### Load the Model

As previously mentioned, the model isn't loading properly. Because of how ambiguous the error messages I'm getting are, there are a wide variety of reasons as to why this is, so I need to investigate each and every one of them to find out why exactly my model isn't loading. This is extremely time consuming, but is something I plan on doing in the future.

### More Extensive Dataset

Whilst the current dataset already has 38 different types of diseases, compared to the incalculable number in the world, 38 is not that many. This means that perhaps the vast majority of users of this app will be attempting to detect diseases that the model simply doesn't know about. Furthermore, there may be some regional bias in the dataset and it may not encompass a wide variety of plant diseases from different biomes around the world. Thus, in the future, I would like to create a more comprehensive app that can identify many more diseases.
