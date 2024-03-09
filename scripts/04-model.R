#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(modelsummary)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
set.seed(853)

ces2022_reduced <- 
  ces2022 |> 
  slice_sample(n = 500)

us_political_preferences <-
  stan_glm(
    factor(voted_for) ~ gender4 + race,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )



#### Save model ####
saveRDS(
  us_political_preferences,
  file = "model/first_model.rds"
)


modelsummary(
  list(
    "Support Biden" = us_political_preferences
  ),
  statistic = "mad"
)


