# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_source_folder.R
# DESCRIPTION:    The test ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1


# Load libraries and the function to be tested
# -------------------------------------------------------------------------
library(testthat)
library(here)
source("utilities/source_folder.R")

test_that("source_folder() works", {
  # Test that the function works with a valid folder
  test_folder <- "utilities"
  test_result <- source_folder(test_folder)
  expect_equal(test_result,
               length(list.files("utilities",
                                 pattern = "[.][rR]$",
                                 full.names = TRUE)))

  # Test that the function works with a valid folder and recursive = TRUE
  test_folder <- "utilities"
  test_result <- source_folder(test_folder, recursive = TRUE)
  expect_equal(test_result,
               length(list.files(test_folder,
                                 pattern = "[.][rR]$",
                                 full.names = TRUE,
                                 recursive = TRUE)))

  # Test that the function throws an error with an invalid folder
  test_folder <- "no_utilities"
  expect_error(source_folder(test_folder))
})
