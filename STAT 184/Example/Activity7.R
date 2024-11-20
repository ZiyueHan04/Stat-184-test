library(ggplot2)
library(dplyr)
data <- diamonds

# Create a summary table
diamonds_summary_y <- data %>%
  group_by(cut) %>%
  summarise(
    Count = n(),
    Min_y = min(y),           
    Q1_y = quantile(y, 0.2),  
    Q2_y = quantile(y, 0.4), 
    Median_y = median(y),    
    Q3_y = quantile(y, 0.6),
    Q4_y = quantile(y, 0.8), 
    Max_y = max(y),          
    Mean_y = mean(y),        
    SD_y = sd(y)       
  )

# Print
print(diamonds_summary_y)