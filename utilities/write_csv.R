# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           sink_csv.R
# DESCRIPTION:    Write a dataframe as a .csv file.
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        16 Dec 2022
# VERSION:        0.0.1


# Define function
# -------------------------------------------------------------------------
library(here)
source("utilities/create_directory.R")

write_csv <- function(data, data_path, end_state, source, sink_file) {

  # Construct the path for the output file
  write_path <- here(data_path, end_state, source)

  # Create the directory if it does not exist
  create_directory(write_path)

  # Write the data to the CSV file
  readr::write_csv(data, here(write_path, sink_file), na = "NA")

  return(here(write_path, sink_file))
}