test_folder <- "utilities"
print(source_folder(test_folder))
print(length(test_result))
print(length(list.files("utilities", pattern = "[.][rR]$", full.names = TRUE)))