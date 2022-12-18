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
# CREATED:        17 Dec 2022
# VERSION:        0.0.2

library(targets)
library(tarchetypes)
tar_option_set(packages = c("readr", "here", "NHSRdatasets"))

source("utilities/create_directory.R")
source("utilities/get_nhsr_dataset.R")
source("utilities/sink_csv.R")

# Start target list
# -------------------------------------------------------------------------
list(

# Ingest ae_attendance data from {NHSRdatasets} package
# -------------------------------------------------------------------------
nhsr_dataset_name <- "ae_attendances",
tar_target(
  name = ae_attendance_raw,
  command = get_nhsr_dataset(nhsr_dataset_name)
),

# Sink ae_attendance data to raw
# -------------------------------------------------------------------------
data_path <- "data",
end_state <- "raw",
source <- "NHSRdatasets",
sink_file <- "ae_attendances.csv",
tar_target(
  name = ae_attendance_raw_sink,
  command = sink_csv(data = ae_attendance_raw,
                     data_path,
                     end_state,
                     source,
                     sink_file),
  format = "file"
),

# Sink ae_attendance data to interim
# -------------------------------------------------------------------------
data_path <- "data",
end_state <- "interim",
source <- "NHSRdatasets",
sink_file <- "ae_attendances.csv",
tar_target(
  name = ae_attendance_interim_sink,
  command = sink_csv(data = ae_attendance_raw,
                     data_path,
                     end_state,
                     source,
                     sink_file),
  format = "file"
)

# tar_quarto(report, here("templates/ae_attendance.qmd"))

# End target list
# -------------------------------------------------------------------------
)
