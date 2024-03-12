#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Yang Zhou & Yuean Wang & Dong Jun Yoon [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: cocoyang.zhou@utoronto.ca & dongjun.yoon@mail.utoronto.ca & yuean.wang@mail.utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


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
