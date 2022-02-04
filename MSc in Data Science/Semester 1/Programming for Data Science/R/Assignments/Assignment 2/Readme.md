# Questions:

Using the dataset covid_19_india.txt

Q1. read the covid file into a dataframe

Q2. merge the Date and Time columns into a single col and then convert

(a)it into a POSIXlt date using strptime function inside a "within" function

(b)attempt doing the same using dplyr


Q3. find the total number of rows in the dataset month-wise (you may use "months" function with a Date type column or "mon" component of POSIXlt date column)

Q4. find the average number of cases month-wise in dataset and arrange them starting from Jan to Dec (you may use month.name built-in constant for same)

(a) using base R and barplot function (first convert the cumulative Confirmed column to per day Confirmed col using diff function)

(b) using dplyr and ggplot (try using coord_flip and coord_polar from examples & use theme function to rotate the x-axis labels to vertical or some angle)

Q5. visualize the number of confirmed cases year wise but months stacked (use format command to extract the year component or some other suitable technique before proceeding)

Q6. find state-wise the extremes in highs and lows (i.e. the largest fluctuation) in terms of cured, deaths and plot the same using ggplot

Q7. find the number of cases per month (or per quarter) and year wise (Hint: explore months, quarters and format functions)

Q8. plot the data in Q7 using an appropriate plot - scatter

Q9. find the correlation of the no. of Cured and Deaths column after grouping it year and month wise

Q10. create line plots of no. of infections per day for different states

Q11. if you find the plot in Q10 too messy try to filter based on states in alphabetical order e.g. states starting with A,B,C,D,E in one plot those starting with F,G,H, etc in second plot and so on.

Q12. create a new column which assigns "cat1" to the first 10 states arranged alphabetically, "cat2" to the next 10 and so on. use this new column to facet the category-wise line plots into the 5 categories, using

i. direct substitution with multiple assignment operators

ii. custom function and call it using mapply (w/ or w/o dplyr)

Q13. plot the fluctuations of per day confirmed cases statewise, order by amount of fluctuations (Hint: use IQR) hint: use boxplot

Q14. create a fluctuations (IQR) based 4 categories and plot them using geom_jitter

Q15. find the relationship between Confirmed cases per day and deaths per day where the confirmation is a positive number

Q16. find the relationship between deaths per day, confirmed per day, cured per day in a time series plot

Q17. Frame 4 more interesting questions and plot them using appropriate plots.
