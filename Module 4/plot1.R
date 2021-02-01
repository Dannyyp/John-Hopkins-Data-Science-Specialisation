library(dplyr)

data <- read.table('household_power_consumption.txt', header=TRUE, sep=";")
data < as_tibble(data)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

GAP <- dataSub$Global_active_power
GAP <- as.numeric(GAP)

png("plot1.png", height=480, width=480)
hist(GAP, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
dev.off()