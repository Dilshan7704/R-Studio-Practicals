# Install required packages if not already installed
install.packages("class") 
install.packages("caTools")
# Load libraries
library(class)  
library(caTools)  

# Get the current working directory
getwd()  

# Set the working directory
setwd("C:/Users/DELL/Downloads")  

# Load the dataset
DS <- read.csv("medical_knn_dataset.csv", stringsAsFactors = TRUE)  

# Display dataset dimensions
dim(DS)  

# Splitting data into training and testing sets
set.seed(123)  # Ensures reproducibility
split <- sample.split(DS$Disease_Risk, SplitRatio = 0.75)  
train_data <- subset(DS, split == TRUE)  
test_data <- subset(DS, split == FALSE)  

# Display dimensions of train and test sets
dim(train_data)  
dim(test_data)  

# Separating independent variables (features) and dependent variable (target)
train_independents <- train_data[, 1:6]  
train_dependents <- train_data$Disease_Risk  
test_independents <- test_data[, 1:6]  
test_predictions <- test_data$Disease_Risk  

# Apply KNN model
k <- 5  
prediction <- knn(train = train_independents, test = test_independents, cl = train_dependents, k = k)  

# Create a confusion matrix
table(prediction = prediction, actual = test_predictions)  







