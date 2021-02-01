library(dplyr)

data <- read.table('household_power_consumption.txt', header=TRUE, sep=";")
data < as_tibble(data)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

dataSub$Date = as.Date(dataSub$Date, '%d/%m/%Y')
dataSub$Time <- paste(dataSub$Date, dataSub$Time)
dataSub$Time <- as.POSIXct(strptime(dataSub$Time, '%Y-%m-%d %H:%M:%S'))

png("plot3.png", height=480, width=480)
plot(dataSub$Time, dataSub$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(dataSub$Time, dataSub$Sub_metering_2, type='l', col='red')
lines(dataSub$Time, dataSub$Sub_metering_3, type='l', col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red", "blue"), lty=1)

dev.off()