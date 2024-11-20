install.packages("tidyr")
library(palmerpenguins)
library(dplyr)
library(broom)
library(tidyr)

# Prepare the data frame
adelie_data <- penguins %>%
  filter(species == "Adelie") %>%
  drop_na(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, island)

# linear regression model
penguinModel <- lm(
  body_mass_g ~ bill_length_mm + bill_depth_mm + 
    flipper_length_mm + sex + island,
  data = adelie_data
)

# tidy summary
tidy_summary <- tidy(penguinModel)

# Print
print(tidy_summary)