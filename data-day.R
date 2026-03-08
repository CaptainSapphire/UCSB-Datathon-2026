##########
(2*5)/4
age <- 30
age + 50
future_age <- age + 50
future_age
data("penguins")
View(penguins)

########### actual R
install.packages('tidyverse')
library(tidyverse)
install.packages(library(tidyr))
install.packages('ggplot2')
library(ggplot2)

# To return the column names
colnames(penguins)
# To see the first six rows
head(penguins)
# Using a different argument in head, to see the first 10 rows
head(penguins, n = 10)
# To know how many rows and columns our data has
dim(penguins)
# To get a quick summary of each column in our data
summary(penguins)
# Data cleaning
# Solution
penguins_clean <- ?drop_na(penguins)
penguins_clean <- penguins %>% drop_na()

###################################################
# ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) +
#   <GEOM_FUNCTION>()


ggplot()
ggplot(data = penguins_clean)
# adding a mapping to x and y axes
ggplot(data = penguins_clean, mapping = aes(x = flipper_len, y = body_mass)) +
  geom_point()

ggplot(data = penguins_clean, mapping = aes(x = flipper_len, y = body_mass, color = species)) +
  geom_point()

# Solution
ggplot(data = penguins_clean, mapping = aes(x = flipper_len, y = body_mass, color = species, shape = species)) +
  geom_point()

ggplot(data = penguins_clean, mapping = aes(x = island)) +
  geom_bar()


ggplot(data = penguins_clean, mapping = aes(x = sex)) +
  geom_bar()

ggplot(data = penguins_clean, mapping = aes(x = island)) +
  geom_bar() +
  labs(title = "Number of penguins per island",
       x = "Island",
       y = "Count")


## make your own
ggplot(penguins_clean, aes(x=flipper_len, y=bill_len, color=species))+geom_point()

ggplot(penguins_clean, aes(x=flipper_len, y=bill_len, color=species))+geom_line()


ggplot(penguins_clean, aes(x = flipper_len, y = body_mass, color = species)) +
  geom_point() + 
  facet_wrap(~island) +
  labs(title = "Size vs Weight Across Different Islands",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)",
       color = "Species")

life_exp <- read.csv("lex.csv")
