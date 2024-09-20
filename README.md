# CarPricePrediction
## Project Overview

This project focuses on developing a car price prediction model for an automotive company using various car attributes. We utilize the K-Nearest Neighbors (KNN) algorithm in R to predict car prices based on features such as make, fuel type, body style, and engine specifications.

The workflow includes steps like data exploration, preprocessing, model training, evaluation, and hyperparameter tuning. The final model can be used to analyze trends in car pricing and inform decision-making within the automotive industry.

## Objectives

Develop an effective KNN model to predict car prices.

Explore relationships between car attributes and price.

Implement cross-validation and hyperparameter tuning for model optimization.

Evaluate the model using key metrics like Root Mean Squared Error (RMSE) and R-squared.

## Key Features

The dataset used in this project includes various attributes of cars such as:

CarName: The name of the car, including both make and model.

Fuel Type: The type of fuel used (e.g., petrol, diesel).

Horsepower: Power rating of the car’s engine.

Price: The target variable for prediction.

## Workflow Summary

## Data Loading and Preprocessing:
Import the dataset, handle missing values, and process categorical variables.
Extract the make of the car from the car name.
Exploratory Data Analysis (EDA):

Visualize relationships between key features and price using scatter plots and box plots.
Understand trends in the data that influence car pricing.
Model Training:

Train a KNN model to predict car prices, using caret for model training and validation.
Optimize the number of neighbors (k) through cross-validation.
Model Evaluation:

Evaluate the model using metrics such as RMSE and R-squared.
Perform 5-fold cross-validation to avoid overfitting.
Hyperparameter Tuning:

Optimize the model by tuning the hyperparameter k using grid search techniques.
## Tools and Technologies

R: Statistical computing language.

caret: Machine learning package in R.

ggplot2: Data visualization library for creating plots.

dplyr: Data manipulation package for efficient data handling.

readr: For reading data files.

stringr: For string manipulations, such as extracting car make from the car name.

## Model Performance

The performance of the final KNN model is assessed through RMSE and R-squared metrics. After hyperparameter tuning, the model provides insights into car pricing dynamics, helping to predict prices based on various features.

## Conclusion

This project illustrates the implementation of a machine learning model in R to predict car prices. The key stages include data preprocessing, visualization, training, evaluation, and optimization of a KNN model. By leveraging these techniques, the project can offer valuable predictions for car price estimation in the real-world automotive industry.
