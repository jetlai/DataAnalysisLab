

setwd("C:\\Users\\User\\OneDrive\\Degree Year 2\\Programming for Data Analysis\\")
dfdata = read.csv("Electric_Vehicle_Population_Data.csv")
class(dfdata)
dfdata

#exploratory analysis
summary(dfdata)
class(dfdata)
head(dfdata,10)
tail(dfdata,5)
nrow(dfdata)
ncol(dfdata)
dim(dfdata)
colnames(dfdata)


# do some cleaning

#Remove duplicate rows
dfdata = unique(dfdata)
nrow(dfdata)

# do some cleaning - remove any rows with empty columns
dfdata <- dfdata[complete.cases(dfdata),]
nrow(dfdata)
head(dfdata,10)

library(dplyr)



#Question 1 - show the list of cities in this dataset, 
#how many cities are there in this dataset

cities = unique(dfdata$City)
cities
cities_count= length(cities)
cities_count
n_distinct(dfdata$City)


#Question 2 - show the list of models that are eligible for 
#Clean Alternative Fuel Vehicle status

models = dfdata %>% select(Model,EligibilityStatus=
                             Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility)

head(models,5)
models = unique(models)
models = models %>% filter(EligibilityStatus == "Clean Alternative Fuel Vehicle Eligible" )
models$Model


#Question 3 - What are the reasons some vehicle models are 
#not eligible for Clean Alternative Fuel Vehicle Eligible status
status = dfdata %>% select(EligibilityStatus=Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility)
status = unique(status)
status = status %>% filter(EligibilityStatus != "Clean Alternative Fuel Vehicle Eligible" )
status


#Question 4 - Which is the first make and model to be 
#eligible for Clean Alternative Fuel Vehicle Eligible status

models = dfdata %>%  
  filter(Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility == 
           "Clean Alternative Fuel Vehicle Eligible" ) %>%
  select(Make, Model, Model.Year)
models = unique(models)
models = models %>% arrange(Model.Year, Make, Model)
models %>% slice_head(n = 1)
head(models,1)


#Question 5 - what are the top 3 cities with highest number of electric vehicles

uscity = dfdata %>% group_by(City) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) 
head(uscity,3)


#Question 6 - Show the yearly growth of the electric vehicle population
#dev.off()

yearlygrowth = dfdata %>% group_by(Model.Year) %>% 
  summarise(count = n()) 
print(yearlygrowth,n=25)

library(ggplot2)
?ggplot
# Format the line type
ggplot(data=yearlygrowth, aes(x=Model.Year, y=count)) +
  geom_line(linewidth=1) + geom_point()