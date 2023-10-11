# Airbnb Data Analysis & Price Prediction

This repository contains two projects related to Airbnb property data. The first project focuses on data analysis to gain insights into property trends and pricing patterns, while the second project involves evaluating different regression models for predicting Airbnb property prices. Below are the details of each project.

## Project 1: Airbnb Data Analysis

### Project Overview
The first project aims to analyze Airbnb data to gain insights into property trends and pricing patterns in New York City. It includes various data analysis tasks and visualization to reveal valuable information about Airbnb listings.

### Project Objectives
1. Calculate the number of properties in each neighborhood group.
2. Determine which neighborhood group has the highest prices and visualize this with a bar chart.
3. Identify which neighborhood group has the lowest prices and visualize it.
4. Find the highest and lowest price Airbnb listings in each neighborhood group.
5. Identify the host with the highest count of properties.
6. Determine the most expensive and cheapest neighborhoods and create top 10 bar charts for comparison.
7. Count the different types of room_type and create a pie chart displaying the percentage of each room type.
8. Create scatter plots showing the relationship between longitude and latitude for different neighborhood groups.
9. Create scatter plots showing the relationship between longitude and latitude for different room types.
10. Generate bar charts comparing room types and neighborhood groups based on their mean, highest, and lowest prices.
11. Create a bar chart that compares room types and neighborhood groups based on their counts.

### Technologies Used
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-Learn

### Data Preprocessing
- Handling missing values in columns like 'name,' 'host_name,' 'last_review,' and 'reviews_per_month.'
- Converting the data type of the 'last_review' column from a string object to datetime for better analysis.

### Data Analysis and Visualization
- Utilizing various data analysis techniques to fulfill the project objectives.
- Creating visualizations, including bar charts, pie charts, and scatter plots to represent the data.

### Dataset
The dataset for this project is 'AB_NYC_2019.csv.' You can find this dataset in the repository.

## Project 2: Airbnb Price Prediction

### Project Overview
The second project involves predicting Airbnb property prices in New York City using different regression models. The models evaluated are Linear Regression, Polynomial Regression, Decision Tree Regression, Random Forest Regression, and Support Vector Regression. This project explores the effectiveness of these models in predicting Airbnb prices.

### Project Objectives
1. Implement and evaluate various regression models.
2. Preprocess the data, including handling missing values, standardization, and feature scaling.
3. Feature engineering, including the use of polynomial features in the Polynomial Regression model.
4. Evaluate the performance of each model using R-squared scores and visualize the predictions against actual values.

### Technologies Used
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-Learn

### Regression Models
- Linear Regression
- Polynomial Regression
- Decision Tree Regression
- Random Forest Regression
- Support Vector Regression

### Conclusion
The project's conclusions are as follows:
- Linear Regression and Polynomial Regression show limited predictive accuracy.
- Decision Tree Regression struggles to predict prices effectively.
- Random Forest Regression demonstrates minimal alignment between predictions and actual values.
- Support Vector Regression exhibits poor predictive performance.
The findings suggest the need for further refinement in model selection, feature engineering, and data preprocessing to improve predictive accuracy.

### Dataset
The dataset for this project is 'AB_NYC_2019.csv.' You can find this dataset in the repository.
