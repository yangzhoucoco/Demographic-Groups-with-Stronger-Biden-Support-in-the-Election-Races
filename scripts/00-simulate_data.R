#### Preamble ####
# Purpose: Simulates political support in United States data based on gender and race
# Author: Yang Zhou, Yuean Wang, Dong Jun Yoon
# Date: 14 March 2024 
# Contact: cocoyang.zhou@mail.utoronto.ca, yuean.wang@mail.utoronto.ca, dongjun.yoon@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Simulate data ####
set.seed(853)

num_obs <- 800

us_political_preferences <- tibble(
  race = sample(0:4, size = num_obs, replace = TRUE),
  gender = sample(1:2, size = num_obs, replace = TRUE),
  support_prob = ((race + gender) / 5),
) |>
  mutate(
    supports_biden = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    race = case_when(
      race == 0 ~ "White",
      race == 1 ~ "Black",
      race == 2 ~ "Hispanic",
      race == 3 ~ "Asian",
      race == 4 ~ "Other"
    ),
    gender = if_else(gender == 1, "Male", "Female")
  ) |>
  select(-support_prob, supports_biden, race, gender)




write.csv(us_political_preferences, "data/simulate_data/simulate_data.csv")
