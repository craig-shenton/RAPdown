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

# Load libraries and global vars
# -------------------------------------------------------------------------
library(targets)
library(tarchetypes)
library(here)
tar_option_set(packages = c("readr", "here", "NHSRdatasets", "dplyr"))

# Load all functions in the utilities folder
# -------------------------------------------------------------------------
source("pkg/R/source_folder.R")
source_folder("pkg/R", recursive = TRUE)

# Start target list
# -------------------------------------------------------------------------
list(

# Ingest ae_attendance data from {NHSRdatasets} package
# -------------------------------------------------------------------------
nhsr_dataset_name <- "ae_attendances",

targets::tar_target(
  name = ae_attendance_raw,
  command = get_nhsr_dataset(nhsr_dataset_name)
),

# Sink ae_attendance data to raw
# -------------------------------------------------------------------------
targets::tar_target(
  name = ae_attendance_raw_sink,
  command = write_to_csv(data = ae_attendance_raw,
                     "data/raw/NHSRdatasets",
                     "ae_attendances.csv"),
  format = "file"
),

# set the period column to show in Month-Year ("%b-%y") format
# -------------------------------------------------------------------------
targets::tar_target(
  name = ae_attendance_format_date,
  command = dplyr_format_date(data = ae_attendance_raw, "period", "%b-%y")
),

# Sink ae_attendance data to interim
# -------------------------------------------------------------------------
targets::tar_target(
  name = ae_attendance_interim_sink,
  command = write_to_csv(data = ae_attendance_format_date,
                     "data/interim/NHSRdatasets",
                     "ae_attendances.csv"),
  format = "file"
),

# Render Quarto template
# -------------------------------------------------------------------------
tarchetypes::tar_quarto(report, here("templates/ae_attendance_min.qmd"),
                        execute_params = list(test = "test"))

# End target list
# -------------------------------------------------------------------------
)
