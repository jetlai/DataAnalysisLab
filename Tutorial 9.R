#Lab 9 

install.packages("nycflights13")
library(nycflights13)
library(dplyr)

flights
df <- flights
str(df)

#Q1
df %>% 
  filter(arr_delay >= 180)
delayed_flights

#Q2 
df %>%
  filter(arr_delay >= 180, dep_delay <= 0)
arrived_flights

#Q3 
df %>%
  filter(arr_delay > 60, (dep_delay - arr_delay) > 50)

#Q4
df %>% 
  filter(dep_time >= 0, dep_time <= 500) %>%
  arrange(desc(dep_time))

df %>% 
  filter(between(dep_time, 0, 500))


#Q5
df  %>% 
  arrange(desc(dep_delay)) %>%
  slice(1)

df %>% 
  summarise(max_dep_delay = max(dep_delay, na.rm = TRUE))

df %>%
  arrange(desc(arr_delay)) %>%
  slice(1)

#Q6
df  %>% 
  arrange(desc(arr_time)) %>%
  slice(1)

#Q7
df  %>% 
  arrange(arr_time) %>%
  slice(1)

#Q8 
df  %>% 
  select(flight, origin, dest)

#To rename column using select verb 
df  %>% 
  select(flight_number = flight, origin, dstination = dest)

#To delete column using select verb 
df %>%
  select(-dep_delay)

df  %>% 
  select(-c(-dep_delay, arr_delay)
         
#Q9
df  %>% 
  filter(year == 2013, month == 6) %>%
  select(flight_number = flight, origin, destination = dest)

#Q10
df  %>% 
  filter(year == 2013, month == 1, day == 1) %>%
  select(carrier, dep_delay) %>%
  arrange(desc(dep_delay)) %>%
  slice(1)




 
