# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           _targets.R
# DESCRIPTION:    Define target functions
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        16 Dec 2022
# VERSION:        0.0.1

library(targets)
tar_config_set(script = "transforms/_targets.R")
tar_option_set(packages = c("readr", "here", "NHSRdatasets"))

source("utilities/create_directory.R")
source("utilities/get_nhsr_dataset.R")
source("utilities/sink_csv.R")

# Define 'load_ae_attendance_data' target
# -------------------------------------------------------------------------
nhsr_dataset_name <- "ae_attendances"
load_ae_attendance_data <- tar_target(
  name = input,
  command = get_nhsr_dataset(nhsr_dataset_name)
)

# Define 'sink_csv_to_raw' target
# -------------------------------------------------------------------------
data_path <- "data"
end_state <- "raw"
source <- "NHSRdatasets"
sink_file <- "ae_attendances.csv"
sink_csv_to_raw <- tar_target(
  name = output,
  command = sink_csv(input,
                     data_path,
                     end_state,
                     source,
                     sink_file),
  format = "file"
)

# Set target order
# -------------------------------------------------------------------------
list(load_ae_attendance_data, sink_csv_to_raw)