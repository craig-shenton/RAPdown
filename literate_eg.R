library(targets)
library(tarchetypes)

if (identical(Sys.getenv("TAR_LONG_EXAMPLES"), "true")) {
targets::tar_dir({ # tar_dir() runs code from a temporary directory.
# Parameterized Quarto:
lines <- c(
  "---",
  "title: 'report.qmd file'",
  "output_format: html_document",
  "params:",
  "  par: \"default value\"",
  "---",
  "Assume these lines are in a file called report.qmd.",
  "```{r}",
  "print(params$par)",
  "```"
)
writeLines(lines, "report.qmd") # In tar_dir(), not the user's file space.
# The following pipeline will run the report for each row of params.
targets::tar_script({
  library(tarchetypes)
  list(
    tar_quarto_rep(
      report,
      path = "report.qmd",
      execute_params = tibble::tibble(par = c(1, 2))
    )
  )
}, ask = FALSE)
# Then, run the targets pipeline as usual.
})
}
