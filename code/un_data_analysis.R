library(tidyverse)

# Read in data (make sure read_csv not read.csv!)

gapminder_data <- read_csv("data/gapminder_data.csv")


# Summarize ---------------------------------------------------------------
# to add a header in RStudio, use Cmd/Ctrl+Shift+R or 
# go to Code > Insert Section Header

# What is the mean life expectancy

summarize(gapminder_data, averageLifeExp = mean(lifeExp) )

# Ctrl/CMD-shift-m for pipe
# writing to console
gapminder_data %>%
  summarize(averageLifeExp = mean(lifeExp))

# save to object
gapminder_data_summarized <- gapminder_data %>%
  summarize(averageLifeExp = mean(lifeExp))

gapminder_data_summarized

# What is the mean life expectancy for the most recent year

# what is the max year?

gapminder_data %>% 
  summarize(recent_year = max(year))

# get max year in filter()

gapminder_data %>% 
  filter(year == 2007) %>%  
  summarize(average = mean(lifeExp))

# the hard way without pipe
# summarize(filter(gapminder_data, year == 2007), 
#          average = mean(lifeExp))
# What is the mean GDP per capita for the first/earliest year?

# what is the earliest year in the dataset?

gapminder_data %>% 
  summarize(first_year = min(year))

# summarize average GDP for the earliest year in the dataset

gapminder_data %>% 
  filter(year == 1952) %>% 
  summarize(average_gdp = mean(gdpPercap))

# Grouping ---------------------------------------------------------------
# What is the mean life expectancy for each year

gapminder_data %>% 
  group_by(year, country) %>% 
  summarize(average = mean(lifeExp)) 

# What is the mean life expectancy for each continent

gapminder_data %>% 
  group_by(continent) %>% 
  summarize(average = mean(lifeExp))

gapminder_data %>% 
  group_by(year, continent) %>% 
  summarize(average = mean(lifeExp))

# What is the mean life expectancy AND mean GDP per capita 
# for each continent

gapminder_data %>% 
  group_by(continent) %>% 
  summarize(
    meanLifeExp = mean(lifeExp),
    maxLifeExp = max(lifeExp),
    meangdpPercap = mean(gdpPercap)
  )

# Mutate ---------------------------------------------------------------

gapminder_data %>% 
  mutate(double_year = year * 2, .before = pop)

# What is the GDP (not per capita)?
# by multiplying pop x gdpPercap

gapminder_data %>% 
  mutate(gdp = pop * gdpPercap)

# Make a new column for population in millions

gapminder_data %>% 
  mutate(
    gdp = pop * gdpPercap,
    popInMillions = pop / 1000000
    ) %>% 
  # glimpse rotates the view so it will fit in the console better
    glimpse()

mysummary <- gapminder_data %>% 
  group_by(country) %>% 
  filter(continent == "Asia") %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  summarize(meanGDP = mean(gdp))
mysummary
view(mysummary)

gapminder_data %>% 
  distinct(continent)

gapminder_data %>% 
  count(continent)

gapminder_data %>% 
  filter(is.na(country))

mysummary <- mysummary %>% 
  mutate(meanGDPInMillions = meanGDP / 1000000)


# Select ---------------------------------------------------------------

# select(): chooses a subset of columns from a dataset

gapminder_data %>% 
  select(pop, year)

gapminder_data %>% 
  select(-continent, -country)

# Create a tibble with only country, continent, 
# year, lifeExp

gapminder_data %>% 
  select(country, continent, year, lifeExp)

# select helper function: starts_with()

gapminder_data %>% 
  select(year, starts_with("c"))

# select columns with names ending in "p" 
# using ends_with()

gapminder_data %>% 
  select(ends_with("p"))


# Reshaping ---------------------------------------------------------------

gapminder_data %>% 
  select(country, continent, year, lifeExp)

# pivot_wider()

widedata <- gapminder_data %>% 
  select(country, continent, year, lifeExp) %>% 
  pivot_wider(names_from = year, 
              values_from = lifeExp,
              names_prefix = "yr")


# Joins -------------------------------------------------------------------



# improvised attempt (non-functional)

#co2_data <- read_csv("data/co2-un-data.csv", skip = 1) %>% 
#  rename(countries = `...2`)

#joined <- left_join(gapminder_data, co2_data, 
#                    by = c("country" = "countries",
#                           "year" = "Year"))

                    