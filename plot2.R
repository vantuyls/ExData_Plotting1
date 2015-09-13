theData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

theData$Date <- as.Date(theData$Date, format = "%d/%m/%Y")
theData$Time <- as.POSIXlt(theData$Time, format = "%H/%M/%S")

plotData <- filter(theData, Date == "2007-02-01" | Date == "2007-02-02")
timestamp <- as.POSIXct(paste(plotData$Date, plotData$Time), "%Y/%m/%d %H:%M:%S")
plotData <- cbind(plotData, timestamp)


png(file = "plot2.png", width = 480, height = 480)
with(plotData, plot(plotData$timestamp, plotData$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = NA))

lines(plotData$timestamp, plotData$Global_active_power)
dev.off()




