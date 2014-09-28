source("home.R")
t <- tbl(stat_store,"account")
t.trialConversionRate <- t %>%
  mutate(dateTrialFromDate = date(trialFromDate)) %>%
  group_by(dateTrialFromDate,firstSignInClient) %>%
  summarise(rate = sum(!is.na(fromDate))/n())
df <- collect(t.trialConversionRate)
df$month <- month(df$dateTrialFromDate)

ggvis(df,~month,~rate,stroke=~firstSignInClient) %>%
  layer_lines()

rm(t)
rm(t.trialConversionRate)
rm(df)