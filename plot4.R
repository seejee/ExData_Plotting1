library(data.table)

if(!file.exists('household_power_consumption.txt')) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                destfile = "household_power_consumption.zip")
  unzip('household_power_consumption.zip')
}

if(!exists("subset")) {
  allData <- fread('household_power_consumption.txt', na.strings="?")
  subset <- subset(allData, Date %in% c('1/2/2007', '2/2/2007'))
}

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# top left
plot(subset$DateTime,
     subset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )

# top right
plot(subset$DateTime,
     subset$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage"
     )

# bottom left
plot(subset$DateTime,
     subset$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering"
)

lines(subset$DateTime, subset$Sub_metering_1)
lines(subset$DateTime, subset$Sub_metering_2, col="red")
lines(subset$DateTime, subset$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=c(1, 1, 1),
       bty="n"
       )

plot(subset$DateTime,
     subset$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
     )

dev.off()