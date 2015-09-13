theData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

theData$Date <- as.Date(theData$Date, format = "%d/%m/%Y")
theData$Time <- as.POSIXlt(theData$Time, format = "%H/%M/%S")

plotData <- filter(theData, Date == "2007-02-01" | Date == "2007-02-02")
timestamp <- as.POSIXct(paste(plotData$Date, plotData$Time), "%Y/%m/%d %H:%M:%S")
plotData <- cbind(plotData, timestamp)

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#upper left plot
with(plotData, {
plot(plotData$timestamp, plotData$Global_active_power, type = "n", ylab = "Global Active Power", xlab = NA)
lines(plotData$timestamp, plotData$Global_active_power)    
})    

#upper right plot
with(plotData, {
plot(plotData$timestamp, plotData$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(plotData$timestamp, plotData$Voltage)
})

#lower left plot
with(plotData, {
plot(plotData$timestamp, plotData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA)
lines(plotData$timestamp, plotData$Sub_metering_1)
lines(plotData$timestamp, plotData$Sub_metering_2, col = "red")
lines(plotData$timestamp, plotData$Sub_metering_3, col = "blue")
legend("topright", legend = colnames(plotData[,7:9]), col = c("black", "red", "blue"), lwd = 1, cex=0.5, bty = "n")
})

#lower right plot
with(plotData, {
plot(plotData$timestamp, plotData$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(plotData$timestamp, plotData$Global_reactive_power)
})



dev.off()

