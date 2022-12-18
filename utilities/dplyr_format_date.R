
# function that takes a data frame and a list of column names as input and allows you to apply several formatting options to the specified columns:

library(dplyr)

dplyr_format_date <- function(data, cols, date_format) {
  data %>%
    dplyr::mutate_at(dplyr::vars(cols), function(x) {
      as.character(format(as.Date(x), date_format))
    })
}