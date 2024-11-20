#Goal:Tidy the Hypoxia Data

##Needs---
###We need case
###load the data
###Functions/verbs: rename, pivot(wider and longer), separating,
###recoarding/parsing, mutate

##Intstructions/Steps--
###Step 0: Load data&packages
###step 1:Fix names
###step 2:Fix the altitude values
###step 3:Remove extra rows/columns
###step 4:Reshaping to get to our 12 cases
###step 5:

hypoxiaHeader<-read.table(
  file="C:/Users/hanzi/OneDrive/Desktop/hypoxia.csv",
  header=FALSE,
  sep=",",
  nrows=2
)

hypoxiaRaw<-read.table(
  file="C:/Users/hanzi/OneDrive/Desktop/hypoxia.csv",
  header=FALSE,
  sep=",",
  skip=2
)

library(tidyverse)

load("tidyverse")

hypoxiaCleaned<- hypoxiaRaw %>%
  rename(
    junk=V1,
    Altitude=V2,
    Air_pressure_mmHg=V3,
    ppO2_mmHg=V4,
    O2LungPressure_mmHg.21=V5,
    blood02.21=V6,
    CO2_LungPressure_mmHg.21=V7,
    O2_LungPressure_mmHg.100=V8,
    bloodO2.100=V9,
    CO2_LungPressure_mmHg.100=V10
  ) %>%
  dplyr::select(-junk)
  mutate(
    Altitude=case_match(
      Altitude,
      "Sea level"~"0K/0K",
      .default = Altitude
    )
  )%>%
  separate_wider_delim(
    cols=Altitude,
    delim="/",
    names=c("Altitude_ft","Altitude_m")
  )
  
  mutate(
    Altitude_ft=readr::parse_number(Altitude_ft)*1000,
    Altitude_m=readr::parse_number(Altitude_m)*1000
  )%>%
    
  pivot_longer(
    cols= O2LungPressure_mmHg.21:CO2_LungPressure_mmHg.100,
    names_to="key",
    values_to="pressureReading"
  )%>%
  
  separate_wider_delim(
    cols=,
    delim = "",
    names=c("reading","O2_Percent")
  )%>%
  
  pivot_wider(
    names_from = reading,
    values_from = pressureReading
  )
  
  
  
  