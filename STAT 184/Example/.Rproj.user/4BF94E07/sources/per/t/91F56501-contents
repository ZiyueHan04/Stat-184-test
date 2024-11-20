library(dplyr)

file_path <- "C:/Users/hanzi/OneDrive/Desktop/STAT 184/Example/US Armed Forces (6_2024) - Sheet1.csv"
data <- read.csv(file_path, stringsAsFactors = FALSE)

# Rename
colnames(data) <- c(
  "Pay_Grade", "Army_Male", "Army_Female", "Army_Total",
  "Navy_Male", "Navy_Female", "Navy_Total",
  "Marine_Male", "Marine_Female", "Marine_Total",
  "Air_Force_Male", "Air_Force_Female", "Air_Force_Total",
  "Space_Force_Male", "Space_Force_Female", "Space_Force_Total",
  "Total_Male", "Total_Female", "Grand_Total"
)

# Remove
cleaned_data <- data[-c(1, 2), ]

# male table
male_data <- cleaned_data %>%
  select(Pay_Grade, Army_Male, Navy_Male, Marine_Male, Air_Force_Male, Space_Force_Male) %>%
  filter(!is.na(Pay_Grade))

# female table
female_data <- cleaned_data %>%
  select(Pay_Grade, Army_Female, Navy_Female, Marine_Female, Air_Force_Female, Space_Force_Female) %>%
  filter(!is.na(Pay_Grade))

# Print
print("Male Frequency Table:")
print(male_data)

print("Female Frequency Table:")
print(female_data)
