source("http://rako1.com/home.R")
s <- tbl(stat_store,"subscription")
s.churnRateByMonth <- s %>%
  filter(productId == 1,!is.na(fromDate),fromDate >= "2014-08-01" ) %>%
  mutate(dt_fromDate = date(fromDate),
         dt_toDate = date(toDate),
         mn_fromDate = month(fromDate)) %>%
  select(mn_fromDate,priceCode,dt_fromDate,dt_toDate) %>%
  group_by(mn_fromDate,priceCode) %>%
  summarise(begMo = sum(mn_fromDate))

head(s.churnRateByMonth)





#   | Field         | Type        | Null | Key | Default | Extra          |
#   +---------------+-------------+------+-----+---------+----------------+
#   | subId         | bigint(20)  | NO   | PRI | NULL    | auto_increment |
#   | productId     | int(11)     | YES  | MUL | NULL    |                |
#   | accountId     | bigint(20)  | YES  | MUL | NULL    |                |
#   | trialFromDate | datetime    | YES  |     | NULL    |                |
#   | trialToDate   | datetime    | YES  |     | NULL    |                |
#   | fromDate      | datetime    | YES  |     | NULL    |                |
#   | toDate        | datetime    | YES  |     | NULL    |                |
#   | priceCode     | float       | YES  |     | NULL    |                |
#   | denomination  | varchar(10) | YES  |     | USD     |                |
#   | channel       | varchar(10) | YES  |     | NULL    |                |
#   | deviceId      | bigint(20)  | YES  |     | NULL    |                |
#   | lastUsedDate  | datetime    | YES  |     | NULL    |                |
#   +---------------+-------------+------+-----+---------+----------------+
#   12 rows in set (0.08 sec)



##paid periods before churn (WORKING)
source("http://rako1.com/home.R")
a <- tbl(stat_store,"account")
a.churnPeriods <- a %>%
  filter(fromDate>="2014-01-07",productId==2,!is.na(toDate),toDate >= fromDate) %>%
  select(fromDate,toDate)
df <- collect(a.churnPeriods)
df$fromDate <- ymd_hms(df$fromDate)
df$toDate <- ymd_hms(df$toDate)
df$fromDate <- round_date(df$fromDate,unit="day")
df$toDate <- round_date(df$toDate,unit="day")
df$daysBeforeChurn = as.numeric(df$toDate - df$fromDate)
ggplot(df,aes(x=daysBeforeChurn)) + geom_histogram(binwidth=1)

