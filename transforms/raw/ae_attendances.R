# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           ae_attendances.R
# DESCRIPTION:    Ingest NHS-R dataset `ae_attendances` as .csv to simulate
#                 real-world data pipleine.
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        15 Dec 2022
# VERSION:        0.0.1


# Load libraries and global vars
# -------------------------------------------------------------------------
library(here)
library(NHSRdatasets)
source("utilities/create_directory.R")

# set global vars
# -------------------------------------------------------------------------
data_path <- "data"
end_state <- "raw"
source <- "NHSRdatasets"
sink_file <- "ae_attendances.csv"

# load dataset
# -------------------------------------------------------------------------
data("ae_attendances")
df <- ae_attendances


# write data to .csv
# -------------------------------------------------------------------------
write_path <- here(data_path, end_state, source)
create_directory(write_path) # check if dir exist, else create it
write.csv(df, here(write_path, sink_file), row.names = FALSE)