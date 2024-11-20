library(tidyverse)
library(rvest)

espnRaw<-read_html("https://www.espn.com/college-football/team/stats/_/id/213/penn-state-nittany-lions")%>%
  html_elements(css="table")%>%
  html_table()

espnRushingRaw<-bind_cols(espnRaw[[3]],espnRaw[[4]])

View(espnRushingRaw)
psuRaw<-read_html("https://gopsusports.com/sports/football/roster?view=table")%>%
  html_elements(css="table")%>%
  html_table()

psuRosterRaw<-psuRaw[[1]]


