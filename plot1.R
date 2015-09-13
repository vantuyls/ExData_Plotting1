
theData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

theData$Date <- as.Date(theData$Date, format = "%d/%m/%Y")
theData$Time <- as.POSIXlt(theData$Time, format = "%H/%M/%S")

plotData <- filter(theData, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot1.png", width = 480, height = 480)
with(plotData, hist(plotData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", axes = 0))
axis(side = 2, at = seq(0, 1200, 200), labels = seq(0, 1200, 200), las = 2)
axis(side = 1, at = c(0, 2, 4, 6))
dev.off()