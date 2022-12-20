# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_dplyr_filter_cols.R
# DESCRIPTION:    This test case...
#
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1


# Load libraries and the function to be tested
# -------------------------------------------------------------------------
library(testthat)
library(dplyr)
source("utilities/dplyr_filter_cols.R")

test_that("dplyr_filter_cols works correctly", {

  expected_output <- mtcars %>%
                        filter(mpg > 30)
  actual_output <- dplyr_filter_cols(mtcars, mpg > 30)
  expect_equal(expected_output, actual_output)
})