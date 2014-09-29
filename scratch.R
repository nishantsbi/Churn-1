source("home.R")
t <- tbl(stat_store,"account")
t.trialConversionRate <- t %>%
  mutate(dateTrialFromDate = date(trialFromDate)) %>%
  filter(trialFromDate > "2014-08-27") %>%
  group_by(dateTrialFromDate) %>%
  summarise(rate = sum(!is.na(fromDate))/n())

df <- collect(t.trialConversionRate)
df$month <- month(df$dateTrialFromDate)
df$dateTrialFromDate <- ymd(df$dateTrialFromDate)

ggplot(df,aes(x=dateTrialFromDate,y=rate)) + geom_area(alpha=.2)
df %>% ggvis(~dateTrialFromDate,~rate) %>% layer_points() %>% layer_lines()

rm(t)
rm(t.trialConversionRate)
rm(df)

