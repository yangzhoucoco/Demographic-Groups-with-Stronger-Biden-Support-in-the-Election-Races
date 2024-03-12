#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Yang Zhou & Yuean Wang & Dong Jun Yoon 
# Date: 12 March 2024 
# Contact: cocoyang.zhou@utoronto.ca & dongjun.yoon@mail.utoronto.ca & yuean.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No


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


