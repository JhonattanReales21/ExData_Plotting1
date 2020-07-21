library(dplyr)
library(lubridate)
library(funModeling)

datos <- read.table("household_power_consumption.txt", sep = ";", header = T)
df_status(datos)

db <- datos


lubridate::

db$Date <- dmy(db$Date)


data_for_plots <- db %>% filter(Date == "2007-02-01" | Date == " 2007-02-02")
















