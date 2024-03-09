#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####
simulate_data <- read.csv("data/simulate_data/simulate_data.csv")
test_that("Check class", {
  expect_type(cleaned_data$race, "character")
  expect_type(cleaned_data$gender, "character")
})

