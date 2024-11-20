install.packages('googlesheets4') 
library(googlesheets4)
library(tidyverse)
gs4_deauth()
galtonRaw <- read_sheet(
  ss = 'https://docs.google.com/spreadsheets/d/1Txj51UpLCgYR6nsh1kytBuwZm7agzVIK7feY8S0ZYrw/edit?usp=sharing'
)
view(galtonRaw)

galtonClean = galtonRaw %>%
  select(!family) %>%
  separate_wider_delim(
    cols = c('Sons in order of height'),
    delim = ',',
    names = c('Son_1','Son_2','Son_3'),
    too_few = "align_start"
  ) %>%
  separate_wider_delim(
    cols = c('Daughters in order of height'),
    delim = ',',
    names = c('Dau_1','Dau_2','Dau_3'),
    too_few = "align_start"
  ) %>%
  mutate(across(everything(),  ~ as.numeric(.) + 60))

view(galtonClean)