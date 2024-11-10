# Install and load readxl package
install.packages("readxl")
library(readxl)

# Load the Excel file
data <- read_excel("D:/vscode/R/United Airlines Aircraft Operating Statistics- Cost Per Block Hour (Unadjusted).xls")

# View the first few rows
head(data)

# View the data in RStudio's data viewer
View(data)

# Check the structure of the data
str(data)
