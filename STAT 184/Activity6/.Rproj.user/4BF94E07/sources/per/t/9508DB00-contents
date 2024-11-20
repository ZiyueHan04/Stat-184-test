library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(readr)
library(googlesheets4)
library(rvest)

sheet_url <- "https://docs.google.com/spreadsheets/d/1cn4i0-ymB1ZytWXCwsJiq6fZ9PhGLUvbMBHlzqG4bwo/edit?gid=597536282"

data <- read_sheet(sheet_url)

head(data)

url <- "https://neilhatfield.github.io/Stat184_PayGradeRanks.html"
webpage <- read_html(url)


colnames(data) <- str_trim(colnames(data))
colnames(data)

# Adjust the renaming based on exact column names
data <- data %>%
  dplyr::rename(
    `Pay Grade` = `Active-Duty Personnel by Service Branch, Sex, and Pay Grade`,
    `Army Male` = `...2`,
    `Army Female` = `...3`,
    `Army Total` = `...4`,
    `Navy Male` = `...5`,
    `Navy Female` = `...6`,
    `Navy Total` = `...7`,
    `Marine Corps Male` = `...8`,
    `Marine Corps Female` = `...9`,
    `Marine Corps Total` = `...10`,
    `Air Force Male` = `...11`,
    `Air Force Female` = `...12`,
    `Air Force Total` = `...13`,
    `Space Force Male` = `...14`,
    `Space Force Female` = `...15`,
    `Space Force Total` = `...16`,
    `Total Male` = `...17`,
    `Total Female` = `...18`,
    `Total` = `...19`
  )

data_clean <- data %>%
  select(`Pay Grade`, everything()) %>%
  pivot_longer(
    cols = -`Pay Grade`,
    names_to = c("Branch", "Gender"),
    names_pattern = "(.*)\\s(Female|Male|Total)",
    values_to = "Count"
  ) %>%
  mutate(
    Pay_Grade = str_squish(`Pay Grade`),
    Branch = str_squish(Branch),
    Gender = str_squish(Gender),
    Count = parse_number(Count)
  ) %>%
  drop_na(Count)

individual_data <- data_clean %>%
  uncount(Count)

grouped_data <- data_clean %>%
  group_by(Pay_Grade, Branch, Gender) %>%
  summarize(Total_Soldiers = sum(Count), .groups = "drop")

write.csv(individual_data, "individual_soldiers.csv", row.names = FALSE)
write.csv(grouped_data, "grouped_soldiers.csv", row.names = FALSE)




head(data)

data_clean <- data %>%
  select(Pay_Grade, Branch = everything()) %>%
  pivot_longer(
    cols = -Pay_Grade,
    names_to = c("Branch", "Gender"),
    names_pattern = "(.*)\\s(Female|Male|Total)",
    values_to = "Count"
  ) %>%
  mutate(
    Pay_Grade = str_squish(Pay_Grade),
    Branch = str_squish(Branch),
    Gender = str_squish(Gender),
    Count = parse_number(Count)
  ) %>%
  drop_na(Count)
