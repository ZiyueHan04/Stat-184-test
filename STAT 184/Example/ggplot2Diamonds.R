library(ggplot2)
library(dplyr)
library(babynames)

selected_names <- c("John", "Mary", "Emma")
filtered_data <- babynames %>%
  filter(name %in% selected_names)

ggplot(filtered_data, aes(x = year, y = n, color = name)) +
  geom_line(size = 1.2) +
  labs(
    title = "Popularity of Selected Baby Names Over Time",
    x = "Year",
    y = "Total Number of People with Name",
    color = "Name"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )