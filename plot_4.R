library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", header = T, dec = ".", na.strings = "?" )
data <- as_tibble(data)

data$Date <- dmy(data$Date)
data_for_plots <- data %>% filter(Date == "2007-02-01" | Date == " 2007-02-02")

data_for_plots$new <- paste(data_for_plots$Date, data_for_plots$Time)
data_for_plots$new <- as.POSIXlt(data_for_plots$new)

png(filename = "plot4.png")

par(mfrow=c(2,2), oma= c(0,2,0,2), mar=c( 5.1, 4.1, 4.1, 2.1))

plot(data_for_plots$new, data_for_plots$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")

plot(data_for_plots$new, data_for_plots$Voltage, type = "l", xlab = "datetime",
     ylab = "voltaje")

with(data_for_plots, {
  plot(new, Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering")
  lines(new, Sub_metering_2, col="red")
  lines(new, Sub_metering_3, col="blue")
  legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c(1,2,4), lty=1 )
  
})

plot(data_for_plots$new, data_for_plots$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
