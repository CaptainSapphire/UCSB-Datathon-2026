library(tidyverse)
install.packages('knitr')
library(knitr)
# Might need to modify next line to load the file from the location where you downloaded it
df <- read_csv("data_for_datathon_2014_2016.csv") # Loads the Data Set into the object df
knitr::kable(head(df))
View(df)

# Cleaning data
df <- df |> mutate( # Will change the variables in the df data set
  Vaccinations = case_when(is.na(Vaccinations) ~ "NV", .default = Vaccinations), # Reclassifies Missing Data in Vaccination as "N" per code book.
  ReproductiveStatus = case_when(is.na(ReproductiveStatus) ~ "UN", .default = ReproductiveStatus), # Reclassifies Missing Data in Vaccination as "N" per code book.
  BodyCondition = case_when( # Begins to modify BodyCondition
    as.character(BodyCondition) == "1" ~ "emaciated", # Changes 1 to emaciated
    as.character(BodyCondition) == "2" ~ "thin", # Changes 2 to thin
    as.character(BodyCondition) == "3" ~ "healthy wild", # Changes 3 to healthy wild 
    as.character(BodyCondition) == "4" ~ "extra fat reserves", # Changes 4 to Extra Fat Reserve
    as.character(BodyCondition) == "5" ~ "extreme fat reserves" # Changes 5 to Extreme Fat Reserves
  )
)

summary(df)

df <- drop_na(df, AgeClass, Weight, BodyCondition) # Removes the missing values (NA) using the variables AgeClass, Weight, and BodyCondition

nrow(df)

mean_weight<-mean(df$Weight)
sd_weight<-sd(df$Weight)
mean_weight


sd_weight #printing the values

count_df <- table(df$Sex) # Using the 'Sex' variable from the `df` data set, we count the frequencies of each category with the table function and storing it in rs_df.
count_df # Printing out the contents of "rs_df"
prop.table(count_df) # Computing the Proportions of "rs_df"

ggplot(df) + # Setting up the data to create a plot.
  geom_bar(aes(Sex)) + # Creating a bar chart based on the variable "ReproductiveStatus" 
  theme(axis.title = element_text(size = 14), axis.text = element_text(size = 14))


ggplot(df, aes(x = Sex, y = Weight)) +
  geom_boxplot(fill = "lightblue") +
  labs(
    title = "Boxplot of Weight by Sex",
    x = "Sex",
    y = "Weight"
  ) + theme_minimal()


weight_summary <- df %>%
  group_by(Sex) %>%
  summarise(
    mean_weight = mean(Weight),
    sd_weight = sd(Weight),
    .groups = "drop"
  )
weight_summary


weight_summary_yearly <- df %>%
  group_by(Sex, SamplingYear) %>%
  summarise(
    mean_weight = mean(Weight, na.rm = TRUE),
    sd_weight = sd(Weight, na.rm = TRUE),
    .groups = "drop"
  ) #group the data by Sex and Year and calculate mean and standard deviation of weight
weight_summary_yearly

ggplot(weight_summary_yearly, aes(x = SamplingYear, y = mean_weight)) +
  geom_line() +
  geom_point() +
  geom_errorbar(aes(ymin = mean_weight - sd_weight,
                    ymax = mean_weight + sd_weight), width = 0.2) +
  facet_wrap(~ Sex) +
  labs(
    title = "Average Weight by Year and Sex",
    y = "Mean Weight",
    x = "Year"
  )

#Santa Rosa Fox population 

SR_df<-filter(df,Island=="SRI")

#San Miguel Fox population
SM_df<-filter(df,Island=="SMI")

##############################

#Here is a first question for you to answer: do the foxes on different islands have the same weight? Is there an island where the foxes are significantly heavier than others? To conduct such analysis, you can filter by different Islands:

ggplot(df, aes(x = Sex, y = Weight, color = Sex)) +
  geom_point() + 
  facet_wrap(~Island) +
  labs(title = "Sex vs Weight Across Different Islands",
       x = "Sex",
       y = "Weight",
       color = "Sex")

# Do vaccinated foxes have a different weight compared to unvaccinated ones? To answer this, study the relationship between Weight and Vaccinations
ggplot(df, aes(x = Weight, y = Vaccinations, color = Vaccinations)) +
  geom_jitter() + 
  labs(title = "Vaccinations vs Weight Across Different Islands",
       x = "Weight (Kilograms)",
       y = "Vaccines",
       color = "Vaccinations")

#The dataset has a variable called BodyCondition. What proportion of foxes are well nourished? Do some islands have a larger proportion of “fat” foxes than others? How does BodyCondition connect with Weight? For the latter, you could look into scatter plots.

body_df <- table(df$BodyCondition) # Using the 'Sex' variable from the `df` data set, we count the frequencies of each category with the table function and storing it in rs_df.
body_df # Printing out the contents of "rs_df"
prop.table(body_df)

ggplot(df, aes(x = BodyCondition, y = Weight)) +
  geom_point() + 
  facet_wrap(~Island) +
  labs(title = "",
       x = "",
       y = "",)

