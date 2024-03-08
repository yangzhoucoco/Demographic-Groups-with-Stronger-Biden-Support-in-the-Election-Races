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
simulated_data <- read.csv("data/simulated_data/simulated_data.csv")
test_that("Check class", {
  expect_type(simulated_data$education, "character")
  expect_type(simulated_data$gender, "character")
  expect_type(simulated_data$support_biden, "character")
})

