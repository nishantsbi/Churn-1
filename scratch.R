source("home.R")
table <- tbl(stat_store,"account")
table.sflTrialStarts <- table %>%
  filter(!is.na(firstSignInClient),!is.na(trialFromDate),trialFromDate>"2014-09-01") %>%
  mutate(converted = !is.na(fromDate)) %>%
  select(trialFromDate,fromDate,channel,firstSignInClient,converted) %>%
  group_by(trialFromDate,firstSignInClient) %>%
  summarise(count = n(),
            conversions = sum(converted),
            rate = sum(converted)/n())
            
  
print(table.sflTrialStarts)
print(table)


