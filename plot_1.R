library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", header = T, dec = ".", na.strings = "?" )
data <- as_tibble(data)

data$Date <- dmy(data$Date)

data_for_plots <- data %>% filter(Date == "2007-02-01" | Date == " 2007-02-02")

png(filename = "plot1.png")

hist(data_for_plots$Global_active_power, col = "red", main = "Global active power",
     xlab = "Global Active Power (kilowatts)")

dev.off()




