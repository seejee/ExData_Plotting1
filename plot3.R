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

subset$DateTime <- as.POSIXct(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

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
       lty=c(1, 1, 1)
       )

dev.off()