install.packages("readxl")
library("readxl")
library("dplyr")
?read_excel
exceldata = read_excel("C:\\Users\\User\\OneDrive\\Degree Year 2\\Programming for Data Analysis\\Online Retail.xlsx")
class(exceldata)
dfdata = data.frame(exceldata)
dfdata

#quick checks 
class(dfdata)
head(dfdata,10)
tail(dfdata,5)
nrow(dfdata)
ncol(dfdata)
dim(dfdata)
colnames(dfdata)
glimpse(dfdata)
colnames(dfdata)
mean(dfdata$Quantity)
mean(dfdata$UnitPrice)

#duplicateed(dfdata)
dfdata = unique(dfdata)
nrow(dfdata)

#Q1
length(unique(dfdata$StockCode))

#Q2
summarised = dfdata %>% group_by(StockCode) %>%
  summarise(sum_qty = sum(Quantity))
head(summarised,5)
ordered = summarised %>% arrange(desc(sum_qty))
top5 = head(ordered,5)
top5


#Q3
a = select(dfdata, StockCode, Description)
b = unique(a)
c = b %>% group_by(b$StockCode) %>% summarise(count=n())
d = c %>% filter(count > 1)
d


#Q4 

dfdata$spending <- with(dfdata, Quantity * UnitPrice)
dfdata
head(dfdata,5)

c = dfdata %>% group_by(CustomerID) %>%
  summarise(sum_spending = sum(Quantity))
c
d = c %>% arrange(desc(sum_spending))
d
head(d,1)


#Question 5

e = dfdata %>% group_by(InvoiceNo) %>%
  summarise(count=n())
e
f = e %>% arrange(desc(count))
f
head(f,1)

#Question 6

dfdata = dfdata %>% filter(dfdata$Country !='Unspecified')

a = select(dfdata,Country,StockCode,Quantity)
head(a,10)
b = a %>% group_by(Country,StockCode) %>% 
  summarise(sum_qty = sum(Quantity))
b
c = b %>% arrange(Country,desc(sum_qty),StockCode)
c
d = c %>% top_n(n=1)
d



