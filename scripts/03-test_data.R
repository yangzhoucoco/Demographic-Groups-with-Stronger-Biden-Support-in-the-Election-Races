#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Yang Zhou & Yuean Wang & Dong Jun Yoon 
# Date: 12 March 2024 
# Contact: cocoyang.zhou@utoronto.ca & dongjun.yoon@mail.utoronto.ca & yuean.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####
simulate_data <- read.csv("data/simulate_data/simulate_data.csv")
test_that("Check class", {
  expect_type(cleaned_data$race, "character")
  expect_type(cleaned_data$gender, "character")
})

