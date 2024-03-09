#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Yang Zhou & Yuean Wang [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
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
  race = sample(0:5, size = num_obs, replace = TRUE),
  lgbtq = sample(0:1, size = num_obs, replace = TRUE),
  support_prob = ((race + lgbtq) / 5),
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
    lgbtq = if_else(lgbtq == 0, "LGBTQ", "Non_LGBTQ")
  ) |>
  select(-support_prob, supports_biden, race, lgbtq)




write.csv(us_political_preferences, "data/simulate_data/simulate_data.csv")
