# Load the libraries
library(caret)
library(dplyr)
library(readr)
library(ggplot2)
library(stringr)

# Load the dataset
car_data <- read_csv("/Users/yallareddysadumchinnapareddigari/Desktop/CarPrice.csv")

# Extract car make from CarName column
car_data <- car_data %>%
  mutate(make = word(CarName, 1))

# Check the structure of the data
str(car_data)

# Handling missing values - Remove rows with missing data
car_data <- na.omit(car_data)

# Convert non-numerical columns (e.g., categorical) to factors
car_data <- car_data %>%
  mutate(across(where(is.character), as.factor))

# View summary statistics
summary(car_data)

# Horsepower vs. Price
ggplot(car_data, aes(x = horsepower, y = price)) +
  geom_point() +
  labs(title = "Horsepower vs. Price")

# Price Distribution by Car Make
ggplot(car_data, aes(x = make, y = price)) +
  geom_boxplot() +
  labs(title = "Price Distribution by Car Make")

# Split the data into training and test sets (80% train, 20% test)
set.seed(123)  # For reproducibility
train_index <- createDataPartition(car_data$price, p = 0.8, list = FALSE)
train_data <- car_data[train_index, ]
test_data  <- car_data[-train_index, ]

# Define the training control with 5-fold cross-validation
train_control <- trainControl(method = "cv", number = 5)

# Train the KNN model, tuning for the best k
knn_model <- train(price ~ ., data = train_data, method = "knn",
                   trControl = train_control,
                   tuneLength = 10)  # Search over 10 different k values

# View the best k
print(knn_model$bestTune)

# Plot the performance of different k values
plot(knn_model)

# Predict car prices on the test set
test_predictions <- predict(knn_model, newdata = test_data)

# Evaluate model performance
rmse <- RMSE(test_predictions, test_data$price)
r2 <- R2(test_predictions, test_data$price)

cat("Test RMSE:", rmse, "\n")
cat("Test R-squared:", r2, "\n")

# Hyperparameter tuning grid (manual tuning for k)
grid <- expand.grid(k = seq(1, 20, by = 2))

# Retrain the KNN model using the hyperparameter grid
knn_model_tuned <- train(price ~ ., data = train_data, method = "knn",
                         trControl = train_control,
                         tuneGrid = grid)

# View the best k from the grid search
print(knn_model_tuned$bestTune)

# Plot the tuned performance
plot(knn_model_tuned)

# Predict and evaluate the tuned model on the test set
tuned_predictions <- predict(knn_model_tuned, newdata = test_data)

# Calculate RMSE and R-squared
tuned_rmse <- RMSE(tuned_predictions, test_data$price)
tuned_r2 <- R2(tuned_predictions, test_data$price)

cat("Tuned Model Test RMSE:", tuned_rmse, "\n")
cat("Tuned Model Test R-squared:", tuned_r2, "\n")

