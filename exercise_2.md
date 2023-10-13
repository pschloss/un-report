Exercise 3:
1. Make a new Rmd document in reports/
2. The very first step is to read in the gapminder dataset, so do that first! Also, load the tidyverse package.
3. Make a scatter plot of year vs. population, separated into a plot for each continent. Hint: you can use facet_wrap(vars(column_name)) to separate into different plots based on that column.
4. It seems like there are 2 outliers - which countries are those?
5. Plot year vs. population separated into a plot for each continent but excluding the 2 outlier countries.
6. In the plot above, the years look kind of messy. Can you rotate the x-axis text 90 degrees so that the years are more readable? Feel free to search the internet if you don’t know how to do this!
7. It’s hard to see which country is which here. Can you change the scatter plot to a line plot, so we can get a better sense of trends over time? Hint: This website has more information: https://www.r-graph-gallery.com/line-chart-several-groups-ggplot2.html
8. What country had the highest life expectancy in 1982? Hint: use the slice_max() function to get the row for a maximum value in a dataset. You can use ?slice_max and/or the internet to learn more about how to use the function.
9. Now, do the same thing but for all years! Hint: Use the group_by() function.
10. Make a boxplot for the life expectancies of the countries in Asia for each year (year is the x-axis, life expectancy is the y-axis). Also fix the x and y-axis labels.
11. What are the outliers in life expectancy in Asia for each year (lower life expectancy)?
12. Make a boxplot for the life expectancies of the countries over time for each continent. Try to fix the x and y-axis labels and text, too. Feel free to change the theme if you’d like.
13. Which country has had the greatest increase in life expectancy from 1952 to 2007? Hint: You might want to use the pivot_wider() function to get your data in a format with columns for: country, 1952 life expectancy, 2007 life expectancy, and the difference between 2007 and 1992 life expectancy.
14. What countries had a decrease in life expectancy from 1952 to 2007?
