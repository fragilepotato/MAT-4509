# Install and load readxl package
install.packages("readxl")
library(readxl)
library(fdth)

# Load the Excel file
data <- read_excel("D:/vscode/R/United Airlines Aircraft Operating Statistics- Cost Per Block Hour (Unadjusted).xls")
data <- as.data.frame(data)

# Define fleet names and rows containing "Salaries and Wages" data for each fleet
fleets <- c("Small Narrowbodies", "Large Narrowbodies", "Widebodies", "Total Fleet")
wages_rows <- c(8, 47, 86, 125) - 2

# Helper function to extract data from a row
get_row <- function(row, data) {
  na.omit(as.numeric(data[row, -1]))[1:19] # Convert row to numeric, omit NA, select first 10 values
}

# Helper function to create and print frequency distribution table
create_table <- function(data, fleet_name) {
  interval <- as.integer((max(data) - min(data)) / (log2(length(data)) + 1)) # Class interval calculation
  table <- fdt(data, start = min(data), end = max(data), h = interval) # Create frequency distribution table
  print(paste("Frequency Distribution Table for", fleet_name))
  print(as.data.frame(table$table)) # Print as a data frame
}

# Main loop to create tables for each fleet
for (i in seq_along(wages_rows)) {
  pilots_wages <- get_row(wages_rows[i], data) # Get "Salaries and Wages" for each fleet
  create_table(pilots_wages, fleets[i]) # Create and print the table
}

#test1