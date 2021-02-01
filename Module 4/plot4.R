library(dplyr)

data <- read.table('household_power_consumption.txt', header=TRUE, sep=";")
data < as_tibble(data)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

GAP <- dataSub$Global_active_power
GAP <- as.numeric(GAP)

dataSub$Date = as.Date(dataSub$Date, '%d/%m/%Y')
dataSub$Time <- paste(dataSub$Date, dataSub$Time)
dataSub$Time <- as.POSIXct(strptime(dataSub$Time, '%Y-%m-%d %H:%M:%S'))

png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

#Plot 1 - Top left
plot(dataSub$Time, GAP, type='l', xlab = "", ylab="Global Active Power (kilowatts)")

#Plot 2 - Top Right
plot(dataSub$Time, dataSub$Voltage, type='l', xlab = "datetime", ylab="Voltage")

#Plot 3 - Bottom Left
plot(dataSub$Time, dataSub$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(dataSub$Time, dataSub$Sub_metering_2, type='l', col='red')
lines(dataSub$Time, dataSub$Sub_metering_3, type='l', col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red", "blue"), lty=1)

#Plot 4 - Bottom Right
plot(dataSub$Time, dataSub$Global_reactive_power, type='l', xlab = "datetime", ylab="Global_reactive_power")

dev.off()