

# Unit Test
library(testthat)
library(dplyr)
library(tidyverse)

# Define the unit test
# -------------------------------------------------------------------------
test_that("dplyr_filter_cols works correctly", {
# Create a test data frame
    expected_output <- mpg %>%
        dplyr::group_by(manufacturer) %>%
        dplyr::summarise_at(vars(displ, cty), sum) %>%
        mutate(performance = 1 - displ / cty)


    # Run the function
    actual_output <- add_metric_col_percent(mpg,
                                         "manufacturer",
                                         "displ",
                                         "cty",
                                         "performance")
    expect_equal(expected_output, actual_output)
})