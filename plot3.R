theData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

theData$Date <- as.Date(theData$Date, format = "%d/%m/%Y")
theData$Time <- as.POSIXlt(theData$Time, format = "%H/%M/%S")

plotData <- filter(theData, Date == "2007-02-01" | Date == "2007-02-02")
timestamp <- as.POSIXct(paste(plotData$Date, plotData$Time), "%Y/%m/%d %H:%M:%S")
plotData <- cbind(plotData, timestamp)

png(file = "plot3.png", width = 480, height = 480)
with(plotData, plot(plotData$timestamp, plotData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA))
lines(plotData$timestamp, plotData$Sub_metering_1)
lines(plotData$timestamp, plotData$Sub_metering_2, col = "red")
lines(plotData$timestamp, plotData$Sub_metering_3, col = "blue")
legend("topright", legend = colnames(plotData[,7:9]), col = c("black", "red", "blue"), lwd = 2)

dev.off()
