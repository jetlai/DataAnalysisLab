#Data visualization


library(ggplot2)   #data viz
library(dplyr)     #data manipulation
library(gapminder) #dataset

gapminder
df = gapminder 
head(df)
tail(df)
dim(df)
str(df)
glimpse(df) #can only be used after dplyr is imported 


#Scatter plot: to visualize relationship between two numerical 
#aes represents aesthetic
ggplot(df, aes(x = lifeExp, y = pop))+
  geom_point()

ggplot(df, aes(x = lifeExp, y = pop, colour = continent))+
  geom_point()

ggplot(df, aes(x = lifeExp, y = pop, colour = continent, shape = continent))+
  geom_point()

ggplot(df, aes(x = lifeExp, y = pop, colour = continent, shape = continent, size = gdpPercap))+
  geom_point()

ggplot(df, aes(x = lifeExp, y = pop, colour = continent, shape = continent, size = gdpPercap))+
  geom_point() +
  scale_y_log10() 
  

ggplot(df, aes(x = lifeExp, y = pop, colour = continent, shape = continent, size = gdpPercap))+
  geom_point() + 
  scale_y_log10() +
  theme_bw()

ggplot(df, aes(x = lifeExp, y = pop, colour = continent, shape = continent, size = gdpPercap))+
  geom_point() + 
  scale_y_log10() +
  theme_bw() +
  ggtitle("Population vs life expentancy graph")

ggplot(df, aes(x = lifeExp, y = pop, colour = continent, shape = continent, size = gdpPercap))+
  geom_point() + 
  scale_y_log10() +
  theme_bw() +
  ggtitle("Population vs life expentancy graph") +
  xlab("Life expentancy") +
  ylab("Population")


#boxplot
ggplot(df, aes(x = lifeExp))+
  geom_boxplot()

#lineplost 
malaysia_df <- df%>%
  filter(country == "Malaysia")
malaysia_df
ggplot(malaysia_df, aes(x = year, y = lifeExp))+
  geom_line()

#violinplot 
ggplot(df, aes(x = pop, y = lifeExp))+
  geom_violin()

#histogramplot
ggplot(df, aes(x = lifeExp))+
  geom_histogram(binwidth = 5)


