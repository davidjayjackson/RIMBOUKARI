library(tidyverse)
library(janitor)
library(factoextra)

rm(list = ls())
data <- data.frame(
  Country = c("Albania", "Andorra", "Andorra", "Argentina", "Armenia"),
  Commodity = c("Sheep live", "Sheep live", "Sheep live", "Sheep live", "Goats live"),
  Direction = c("Import", "Export", "Import", "Export", "Import"),
  Value = c(3124.00, 9241.00, 23982.00, 33060.00, 15820.00),
  Netweight = c(0.00, 4550.00, 9400.00, 2100.00, 1450.00),
  Quantity_name = c("Number of items", "Number of items", "No Quantity", "Number of items", "Number of items"),
  Quantity = c(20.00, 94.00, NA, 27.00, 327.00),
  Category = c("01_live_animals", "01_live_animals", "01_live_animals", "01_live_animals", "01_live_animals")
  )
## Clean the data by removing any unnecessary variables and handling any missing values
# Remove unnecessary variables
data$Category <- gsub("[^[:alpha:]]", "", data$Category)
data$Category <- as.factor(data$Category)
data$Commodity <- as.factor(data$Commodity)
# data_cleaned <- data %>% select(-Commodity_code)

# Replace missing values with 0
data$Quantity[is.na(data$Quantity)] <- 0
summary(data)


# Prepare the data for PCA analysis by scaling the numeric variables.
# Select numeric variables to scale
data_num <- data %>% select(Value, Netweight, Quantity)

# Scale the numeric variables
data_scaled <- scale(data_num)

# Perform PCA on the scaled data using the prcomp() 
# function from the stats package.
# Perform PCA
pca <- prcomp(data_scaled, center = TRUE, scale. = TRUE)

# Extract the results from the PCA analysis and visualize 
# the first two principal components using the fviz_pca_ind() 
# function from the factoextra package.

# Extract PCA results
summary(pca)

# Visualize PCA results
fviz_pca_ind(pca, label = "none")


# Load the PCAtools package
# Load the required packages
library(ggfortify)

# Perform PCA analysis on the mtcars dataset
pca_result <- prcomp(mtcars[, 1:7], scale. = TRUE)

# Print the summary of the PCA analysis
summary(pca_result)

# Visualize the results of the PCA analysis
autoplot(pca_result, data = mtcars, colour = 'cyl', loadings = TRUE)


# Load the PCAtools package
library(PCAtools)

# Perform PCA analysis on the mtcars dataset
pca_result <- pca(t(mtcars[, 1:7]), center = TRUE, scale = TRUE)

# Print the summary of the PCA analysis
summary(pca_result)

# Visualize the results of the PCA analysis
autoplot(pca_result, data = mtcars, color = "cyl", loadings = TRUE)



