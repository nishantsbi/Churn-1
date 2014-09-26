source("home.R")
table <- tbl(stat_store,"account")
table.sflTrialStarts <- table %>%
  filter(!is.na(firstSignInClient),!is.na(trialFromDate),trialFromDate>"2014-09-01") %>%
  select(trialFromDate,fromDate,channel,firstSignInClient) %>%
  group_by(trialFromDate,firstSignInClient) %>%
  summarise(count = n())
  
print(table.sflTrialStarts)
print(table)


