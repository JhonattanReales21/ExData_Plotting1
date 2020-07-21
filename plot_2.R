library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", header = T, dec = ".", na.strings = "?" )
data <- as_tibble(data)

data$Date <- dmy(data$Date)
data_for_plots <- data %>% filter(Date == "2007-02-01" | Date == " 2007-02-02")

data_for_plots$new <- paste(data_for_plots$Date, data_for_plots$Time)
data_for_plots$new <- as.POSIXlt(data_for_plots$new)

png(filename = "plot2.png")

plot(data_for_plots$new, data_for_plots$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()




