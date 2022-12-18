
# function that takes a data frame and a list of column names as input and allows you to apply several formatting options to the specified columns:

library(dplyr)

dplyr_format_date <- function(data, cols, date_format) {
  data %>%
    dplyr::mutate_at(dplyr::vars(cols), function(x) {
      as.character(format(as.Date(x), date_format))
    })
}

data <- data.frame(decimal = c(0.5, 0.6, 0.7),
                     number = c(10000, 20000, 30000),
                     date = c("2022-01-01", "2022-02-01", "2022-03-01"))

# Test formatting as dates
expected_output <- data.frame(decimal = c(0.5, 0.6, 0.7),
                                number = c(10000, 20000, 30000),
                                date = c("Jan-22", "Feb-22", "Mar-22"))
actual_output <- dplyr_format_date(data, "date", "%b-%y")
expect_equal(actual_output, expected_output)