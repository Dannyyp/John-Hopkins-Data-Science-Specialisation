library(dplyr)

data <- read.table('household_power_consumption.txt', header=TRUE, sep=";")
data < as_tibble(data)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

GAP <- dataSub$Global_active_power
GAP <- as.numeric(GAP)

dataSub$Date = as.Date(dataSub$Date, '%d/%m/%Y')
dataSub$Time <- paste(dataSub$Date, dataSub$Time)
dataSub$Time <- as.POSIXct(strptime(dataSub$Time, '%Y-%m-%d %H:%M:%S'))

png("plot2.png", height=480, width=480)
plot(dataSub$Time, GAP, type='l', xlab = "", ylab="Global Active Power (kilowatts)")

dev.off()