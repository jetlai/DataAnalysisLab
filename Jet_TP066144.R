#Install packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("stringr")
install.packages("tidyverse")

library(ggplot2)
library(dplyr)
library(stringr)
library(tidyverse)
library(readr)

#Data Import
getwd()

setwd("C:\\Users\\User\\OneDrive - Asia Pacific University\\Degree Year 2\\Programming for Data Analysis\\PFDA assignment\\")

#View Dataset 
Pdata <- read.csv("kl_property_data.csv") 
Pdata

# Data Exploration 
#Structure
str(Pdata)

dim(Pdata)

summary(Pdata)

# To find NA Values
sum(is.na(Pdata$Location))
sum(is.na(Pdata$Size))
sum(is.na(Pdata$Property.Type))
sum(is.na(Pdata$Furnishing))
sum(is.na(Pdata$Price))

# Data Cleaning 

#Remove rows where the first "location" column contains data, but the rest of the columns are empty 
Pdata <- subset(Pdata, !(Location != "" & apply(is.na(Pdata[-1]) | Pdata[-1] == "", 1, all)))

#Remove rows where 'Location' column contains 'Singapore'
Pdata <- subset(Pdata, !grepl("Singapore", Location, ignore.case = TRUE))

# Remove non-numeric characters for the entire price column in your dataset
Pdata$Price <- as.numeric(str_remove_all(Pdata$Price, "[^0-9]"))
head(Pdata$Price)

#remove rows where price < 100000
Pdata <- subset(Pdata, Price >= 100000)

#remove rows with values where unit is not square feet in size column
Pdata <- subset(Pdata, grepl("sq\\. ft\\.$", Size, ignore.case = TRUE) | Size == "" | is.na(Size))

# Split the strings by ":"
split_data <- strsplit(Pdata$Size, ":")

# Extract the parts and create new columns
Pdata$Built_Type <- sapply(split_data, function(x) trimws(x[1]))
Pdata$Size <- sapply(split_data, function(x) trimws(x[2]))

#remove everything after last digit in size column, most probably is the unit
Pdata$Size <- sub("\\D*$", "", Pdata$Size)

#remove comma from size number
Pdata$Size <- gsub(",", "", Pdata$Size)

# Function to clean Size column
#some data had "x" between 2 numbers, found the product and replaced the values
clean_size <- function(size) {
  if (grepl("x", size, ignore.case = TRUE)) {
    size_parts <- strsplit(size, "x")[[1]]
    size_product <- as.character(as.numeric(size_parts[1]) * as.numeric(size_parts[2]))
    return(size_product)
  } else {
    return(size)
  }
}

# Clean the Size column using function above
suppressWarnings({
  Pdata <- Pdata %>%
    mutate(Size = sapply(Size, clean_size))
})

#change size column data type to numeric, values that contain alphabets/symbols are converted to NA
suppressWarnings(Pdata$Size <- as.numeric(Pdata$Size))

#remove rows where size < 400
Pdata <- subset(Pdata, Size >= 400)


# PRICE
# Calculate the quartiles and IQR for Price
Q1 <- quantile(Pdata$Price, 0.25, na.rm = TRUE)
Q3 <- quantile(Pdata$Price, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

# Define the lower and upper bounds for outliers detection
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Identify outliers for Price
outliers <- Pdata$Price < lower_bound | Pdata$Price > upper_bound

# Print the identified outliers for Price
print(Pdata[outliers, ])

# Replace outliers with NA for Price
Pdata$Price[outliers] <- NA

# Replace NA values with the median in the 'Price' column
median_price <- median(Pdata$Price, na.rm = TRUE)
Pdata$Price[is.na(Pdata$Price)] <- median_price
print(median_price)

# Check if there are NA values in the Price column after replacement
CheckPrice <- !is.na(Pdata$Price)
summary(CheckPrice)

# SIZE
#function to find mode
find_mode = function(x){
  u = unique(x)
  tab = tabulate(match(x,u))
  u[tab == max(tab)]
}

Pdata$Built_Type[is.na(Pdata$Built_Type)] <- find_mode(Pdata$Built_Type)

# Calculate the quartiles and IQR for size
Q1 <- quantile(Pdata$Size, 0.25, na.rm = TRUE)
Q3 <- quantile(Pdata$Size, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

# Define the lower and upper bounds for outliers detection
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Identify outliers for size 
outliers <- Pdata$Size < lower_bound | Pdata$Size > upper_bound

# Print the identified outliers for size
print(Pdata[outliers, ])

# Replace outliers with NA 
Pdata$Size[outliers] <- NA

# Replace NA values with the median of the non-missing values in the 'Size' column
median_size <- median(Pdata$Size, na.rm = TRUE)
Pdata$Size[is.na(Pdata$Size)] <- median_size
print(median_size)

# Check if there are NA values in the Size column after replacement
CheckSize <- (!is.na(Pdata$Size))
summary(CheckSize)

# Furnishing
# Replace 'unknown' with NA in the 'Furnishing' column
Pdata$Furnishing[Pdata$Furnishing == "Unknown" | Pdata$Furnishing == ""] <- NA

# Find the mode of the 'Furnishing' column
mode_furnishing <- mode(Pdata$Furnishing)
print(mode_furnishing)

# Replace empty values with the mode of the 'Furnishing' column
Pdata$Furnishing[is.na(Pdata$Furnishing)] <- mode_furnishing

# Check if there are NA values in the Furnishing column after replacement
CheckFurnishing <- (!is.na(Pdata$Furnishing))
summary(CheckFurnishing)

# Property type
#remove parentheses
Pdata$Property.Type <- gsub("\\(.*\\)", "", Pdata$Property.Type)

#remove (num)-sty
Pdata$Property.Type <- gsub("\\b[0-9]+(?:\\.[0-9]+)?-sty\\b", "", Pdata$Property.Type)

#remove whitespaces
Pdata$Property.Type <- trimws(Pdata$Property.Type)

#check all types are unique
u = unique(Pdata$Property.Type)
u

#check for rows with empty property type, returned 0
empty_property_rows <- which(is.na(Pdata$Property.Type))
empty_property_rows

#categorize property type
# Define the property types
Condo <- c('Apartment', 'Condominium', 'Flat', 'Serviced Residence')
Landed <- c('Terrace/Link House', 'Cluster House', 'Residential Land', 'Semi-detached House', 'Townhouse')
Bungalow <- c('Bungalow', 'Bungalow Land')

Pdata <- Pdata %>%
  mutate(Category.Property = case_when(
    Property.Type %in% Condo ~ 'Condo/Apartment',
    Property.Type %in% Landed ~ 'Landed House',
    Property.Type %in% Bungalow ~ 'Bungalow',
    TRUE ~ 'other'
  ))


#Save the new clean dataset 
# Rename the dataset to a new variable name
new_Pdata <- Pdata

# Write the new dataset to a CSV file
write.csv(new_Pdata, file = "new_property_data.csv", row.names = FALSE)



#Jet Lai Kai Jian TP066144
#Analysis 1 What is the average property prices based on the location of neighbourhood ?

#Calculate average price for each loaction and arrange in descending order. 
average_price_location <- new_Pdata %>%
  group_by(Location) %>%
  summarise(Average_Price = mean(Price)) %>%
  arrange(desc(Average_Price))

#Select 5 location with average price
top_five_locations <- head(average_price_location, 5)
print(top_five_locations)

ggplot(top_five_locations, aes(x = Location, y = Average_Price)) +
  geom_bar(stat = "identity", fill = "pink", color = "black") +
  labs(title = "Top 5 Locations by Average Price",
       x = "Location",
       y = "Average Price") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust= 1))


#Analysis 2 What is the relationship between property price and neighbourhood location ?

#Calculate mean price for each location.
locations <- new_Pdata %>%
  group_by(Location) %>%
  summarise(mean_price = mean(Price))

#Select 10 location with mean price in descending order.
ten_neighbourhood <- locations %>%
  arrange(desc(mean_price)) %>%
  head(10)
print(ten_neighbourhood)

ggplot(ten_neighbourhood, aes(x = Location, y = mean_price)) +
  geom_point(color = "darkblue", size = 3) +
  labs(title = "Relationship Between Property Price and Neighborhood Location",
       x = "Neighborhood Location",
       y = "Property Price") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))




#Analysis 3 What is the highest property price in neighbourhood location ?

#Calculate the hihgest property price for each location
highest_property_price <- new_Pdata %>%
  group_by(Location) %>%
  summarise(max_price = max(Price)) %>%
  arrange(desc(max_price)) %>%
  head(5)

ggplot(highest_property_price, aes(x = Location, y = max_price)) +
  geom_point(color = "skyblue", size = 3) +
  labs(title = "Top 5 Locations with Highest Property Prices",
       x = "Location",
       y = "Max Property Price (RM)") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#Display top 5 hihgest property price
print(highest_property_price)





#Extra feature 1 Anova test
install.packages("stats")
library(stats)

anova_model <- aov(Price ~ Location, data = new_Pdata)

anova_result <- anova(anova_model)

print(anova_result)


#Extra feature 2 Regression test (Predictive Analysis)
model <- lm(Price~Location, data= new_Pdata) 
summary(model)

 


