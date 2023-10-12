library(tidyverse) #loading the tidyverse package

#The next line reads in the gapminder_1997.csv file
gapminder_1997 <- read_csv(file = "data/gapminder_1997.csv")
read_csv()
Sys.Date() #prints the date and time
getwd() #prints the current working directory
sum(5,6)

?round()
round(3.1415,3)

#Which of these lines gives you an output of 3.14?
#A
round(x = 3.1415)
#B
round(x = 3.1415, digits = 2)
#C
round(digits = 2, x = 3.1415)
#D
round(2, 3.1415)


result <- 2+2
result

name <- "Sarah"
name

name <- "Flumpert"
name

number1 <- 3
favorite_number <- 1

########################Plotting#########################
ggplot(data=gapminder_1997) +
  aes(x = gdpPercap, 
      y = lifeExp, 
      color = continent, 
      size = pop/1000000) +
  labs(x = "GDP Per Capita", 
       title = "Do people in wealthy countries live longer?", 
       size = "Population (in millions)") +
  geom_point() +
  scale_color_brewer(palette = "Set2")


