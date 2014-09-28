source("home.R")
table <- tbl(stat_store,"account")
table.sflTrialStarts <- table %>%
  filter(!is.na(firstSignInClient),!is.na(trialFromDate),date(trialFromDate)>="2014-01-01") %>%
  mutate(converted = !is.na(fromDate)) %>%
  group_by(trialFromMonth,firstSignInClient) %>%
  summarise(count = n(),
            conversions = sum(converted),
            rate = sum(converted)/n()) %>%


            
print(table.sflTrialStarts)
print(table)

rm(table)
rm(table.sflTrialStarts)
