
library(covr)

devtools::load_all()
# If run with no arguments implicitly calls `package_coverage()`

cov <- package_coverage("utilities")