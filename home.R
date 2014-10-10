setwd("~/Box Sync/Kmieciak, Richard/Data/scripts")

{
  if (!require("RMySQL")) {
    install.packages("RMySQL", repos="http://cran.rstudio.com/") 
    library("RMySQL")
  }
  if (!require("lubridate")) {
    install.packages("lubridate", repos="http://cran.rstudio.com/") 
    library("lubridate")
  }
  if (!require("ggplot2")) {
    install.packages("ggplot2", repos="http://cran.rstudio.com/") 
    library("ggplot2")
  }
  if (!require("dplyr")) {
    install.packages("dplyr", repos="http://cran.rstudio.com/") 
    library("dplyr")
  }
  if (!require("reshape2")) {
    install.packages("reshape2", repos="http://cran.rstudio.com/") 
    library("reshape2")
  }

if (!require("DBI")) {
  install.packages("DBI",repos="http://cran.rstudio.com/")
  library(DBI)
}
if (!require("ggvis")) {
  install.packages("ggvis",repos="http://cran.rstudio.com/")
  library(ggvis)
}
if (!require("zoo")) {
  install.packages("zoo",repos="http://cran.rstudio.com/")
  library(zoo)
}
if (!require("stringr")) {
  install.packages("stringr",repos="http://cran.rstudio.com/")
  library(stringr)
}
if (!require("riverplot")) {
  install.packages("riverplot",repos="http://cran.rstudio.com/")
  library(riverplot)
}

}

{
  #sparkle_reports <- dbConnect(MySQL(), user='sparkle', password='sparkle', dbname='sparkle', host='127.0.0.1', port=13306)
  #stat_store <- dbConnect(MySQL(), user='stats', password='stats', dbname='stat_store', host='127.0.0.1', port=13306)
  stat_store <-src_mysql(user='stats', password='stats', dbname='stat_store', host='127.0.0.1', port=13306)
}
