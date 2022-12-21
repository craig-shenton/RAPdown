# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           add_metric_col_percent.R
# DESCRIPTION:    Function that takes a dataframe, a column to group by,
#                 and numerator and denominator column names.

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1

# Define function
# -------------------------------------------------------------------------
add_metric_col_percent <- function(data,
                                   grouping,
                                   numerator,
                                   denominator,
                                   new_col) {
  library(dplyr)
  df <- dplyr::group_by_(data, grouping) %>%
        dplyr::summarise_at(vars(numerator, denominator), sum)
  df[new_col] <- 1 - (df[numerator] / df[denominator])
  return(df)
}