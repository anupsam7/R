# load the package
library(openintro)

#load data
data(hsb2)

# view the data structure
str(hsb2)

library(dplyr)
glimpse(hsb2)

# table function to count number of categories in a column
table(hsb2$gender)

# filtering
library(dplyr)
hsb2_female <- hsb2 %>%
  filter(gender == 'female')
table(hsb2_female$gender)

# sum with and without pipe
sum(1,2)
1 %>% sum(2)

#calculating average writing score
mean(hsb2$write)

# calculating the score and storing as new variable
(avg_write = mean(hsb2$write))

# creating a new variable write_cat
hsb2 <- hsb2 %>%
  mutate(write_cat = ifelse(
    write < avg_write, # logical condition
    "Below Average",  # value if true  
    "At or Above Average"  # value if false
  ))
table(hsb2$write_cat)

library(ggplot2)
ggplot(data = hsb2, aes(x = read, y = write)) + geom_point()

ggplot(data = hsb2, aes(x = read, y = write, color = schtyp)) + geom_point()
