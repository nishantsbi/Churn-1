source("homehome.R")
t <- tbl(stat_store,"account")
t.trialConversionRate <- t %>%
mutate(dateTrialFromDate = date(trialFromDate)) %>%
  group_by(dateTrialFromDate) %>%
  summarise(rate = sum(!is.na(fromDate))/n())
df <- collect(t.trialConversionRate)
ggvis(df,~dateTrialFromDate,~rate) %>%
  layer_lines()
