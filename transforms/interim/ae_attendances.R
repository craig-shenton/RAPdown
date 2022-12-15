# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           ae_attendances.R
# DESCRIPTION:    Validate NHS-R dataset `ae_attendances` dataset
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        15 Dec 2022
# VERSION:        0.0.1


# Load libraries and global vars
# -------------------------------------------------------------------------
library(here)
library(readr)
library(validate)

# load dataset
# -------------------------------------------------------------------------
data_path <- "data"
start_state <- "raw"
source <- "NHSRdatasets"
source_file <- "ae_attendances.csv"

metric_path <- here(data_path, start_state, source)
ae_attendances <- readr::read_csv(here(metric_path, source_file),
                                  show_col_types = FALSE)

# validate dataset
# -------------------------------------------------------------------------
rules <- validator(ae_attendances,
                   speed >= 0
                 , dist >= 0
                 , speed/dist <= 1.5
                 , cor(speed, dist) >= 0.2)

# write data to .csv
# -------------------------------------------------------------------------
data_path <- "data"
end_state <- "interim"
source <- "NHSRdatasets"
source_file <- "ae_attendances.csv"

write_path <- here(data_path, end_state, source)
create_directory(write_path) # check if dir exist, else create it
readr::write_csv(df, here(write_path, sink_file), na = "NA")