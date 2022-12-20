
# travis CI test



library(dplyr)
source("utilities/dplyr_filter_cols.R")


expected_output <- mtcars %>% filter(mpg > 30)
actual_output <- dplyr_filter_cols(mtcars, mpg > 30)

print(actual_output)