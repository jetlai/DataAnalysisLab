#Lab 7 Data Visualization 

library(ggplot2)
library(dplyr)

economics
df <- economics
str(df)

#Q1 A
ggplot(df, aes(x = date, y = pop))+
  geom_line()+
  labs(title = "Total Population Over Time",
       x = "Date",
       y = "Population")

#Q1 B
ggplot(df %>% filter(date >= "2005-01-01"), aes(x = date, y = pop)) +
  geom_line() +
  labs(title = "Total Population After 2005-01-01",
       x = "Date",
       y = "Population")



#Q2
date_after

ggplot(date_after, aes(x = date, y =pop))+
  geom_line

install.packages("nycflights13")
library(nycflights13)
flights
df2 <- flights
str(df2)

#Q2 A
ggplot(df2, aes(x = carrier))+
  geom_bar()

ggplot(df2, aes(x = carrier, fill = carrier))+
  geom_bar()


#Q2 B
ggplot(df2, aes(x = dep_delay))+
  geom_histogram(binwidth = 25)+
  ylim(0,20000)

ggplot(df2, aes(x = dep_delay))+
  geom_boxplot(fill = 'blue')


#Q2 C
ggplot(df2, aes(x = dep_delay))+
  geom_histogram(binwidth = 25)+
  ylim(0,20000)

ggplot(df2, aes(x = dep_delay))+
  geom_boxplot(fill = 'red')


#Q2 D
ggplot(df2, aes(x = dep_delay, y = arr_delay))+
  geom_point()


#Q2 E
ggplot(df2, aes(x = origin, fill = dest))+
  geom_bar(stat = "count")

ggplot(df2, aes(x = origin, fill = dest))+
  geom_bar(stat = "count", position = "dodge")

