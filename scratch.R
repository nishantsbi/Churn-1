source("http://rako1.com/gaHome.R")
source("http://rako1.com/home.R")
source("http://rako1.com/utility.R")


df.paid <- read.csv("sflPaid1010.csv")
df.paid$date <- mdy(df.paid$date)
df.churnRateByMonth <- df.paid %>%
  group_by(month(date)) %>%
  mutate(lastDay = ceiling_date(ymd("2014-01-23"),unit = "month") - days(1),
         firstDay = floor_date(ymd("2014-01-23"),unit = "month"))
head(df.churnRateByMonth)

ceiling_date(ymd("2014-01-23"),unit = "month") - days(1)



##group_by yearmon (WORKING)
df.paid <- read.csv("sflPaid1010.csv")
df.paid$date <- mdy(df.paid$date)
df.group <- df.paid %>%
  mutate(month = as.numeric(as.yearmon(date))) %>%
  group_by(month)%>%
  mutate(ym = as.yearmon(month)) %>%
  ungroup() %>%
  select(ym,paidSub,churned)
head(df.group)




#         BOP	EOP	LOST	churn rate
# January	0	  2	  0	    0
# Feb	    2	  3	  1   	0.4
# Mar	    3	  4	  1   	0.285714286
# Apr	    4	  3	  1   	0.285714286


#subs at beginning of period
sum(df$mo_fromDate < 1 & (is.na(df$toDate) | month(df$toDate) < 1),na.rm = TRUE  )


#subs at end of period
sum(df$mo_fromDate == 1 & is.na(df$mo_toDate),na.rm = TRUE  ) - sum(df$mo_toDate == 1,na.rm = TRUE)
sum(df$mo_fromDate == 2 & is.na(df$mo_toDate),na.rm = TRUE  ) - sum(df$mo_toDate == 2,na.rm = TRUE)
sum(df$mo_fromDate == 3 & is.na(df$mo_toDate),na.rm = TRUE  )
sum(df$mo_fromDate == 4 & is.na(df$mo_toDate),na.rm = TRUE  )

#churned subs during period
sum(df$mo_toDate == 1,na.rm = TRUE)


sum(!is.na(df$toDate),na.rm = TRUE )



##Paid sub count (WORKING)
t <- tbl(stat_store,"account") %>%
  summarise(s = sum(fromDate< "2014-09-01" & is.na(toDate) & productId == 2))
print(t)


##Paid Churn by Length of term
source("http://rako1.com/home.R")
source("http://rako1.com/utility.R")
a <- tbl(stat_store,"account")
a.paidLength <- a %>%
  filter(productId==2,fromDate >= "2013-10-01") %>%
df <- collect(a.paidLength)
head(a.paidLength$d_fromDate)


## paid churn by month
t <- tbl(stat_store,"account") %>%
  filter(fromDate < "2014-10-01", productId ==2) %>%
  group_by(month(fromDate)) %>%
  summarise(count = n())
print(t)
  




#####TRIAL TO PAID CONVERSION RATE (Working)
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

