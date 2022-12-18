
# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_write_csv.R
# DESCRIPTION:    This test does the following:
#                 1. It sets up test data that includes a temporary .csv file
#                    with the defualt Iris data set.
#                 2. It calls the `sink_csv()`` function with the test data.
#                 3. It checks that the output file was created by calling
#                    `file.exists()`.
#                 4. It checks that the data in the output file is correct by
#                    comparing it to the original Iris data set using
#                    `expect_equal()`.
#
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        15 Dec 2022
# VERSION:        0.0.1


# Load libraries and the function to be tested
# -------------------------------------------------------------------------
library(testthat)
library(here)
library(readr)
source("utilities/write_csv.R")

# Define the unit test
# -------------------------------------------------------------------------
test_that("write_csv writes data to a .csv file", {
  # Set up test data
  data_path <- tempdir()
  end_state <- "test"
  source <- "source"
  sink_file <- "sink.csv"

  # Call the sink_csv function
  write_csv(iris, data_path, end_state, source, sink_file)

  # Check that the output file was created
  expect_true(file.exists(here(data_path, end_state, source, sink_file)))

  # Check that the data in the output file is correct

  ## 1st load file as dataframe
  file <- as.data.frame(read_csv(here(data_path, end_state, source, sink_file)))
  ## 2nd set Species col as factor to match `iris` dataset
  file$Species <- as.factor(file$Species)
  ## expect that the saved file and iris dataset are equal
  expect_equal(file, iris)
})
