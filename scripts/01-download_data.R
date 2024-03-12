#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 12 March 2024 
# Contact: cocoyang.zhou@utoronto.ca & dongjun.yoon@mail.utoronto.ca & yuean.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No


#### Workspace setup ####
library(dataverse)
library(tidyverse)


#### Download data ####
ces2022 <-
  get_dataframe_by_name(
    filename = "CCES22_Common_OUTPUT_vv_topost.csv",
    dataset = "10.7910/DVN/PR4L8P",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, presvote20post, race, gender4)

write_csv(ces2022, "data/raw_datas/raw_datas.csv")



         
