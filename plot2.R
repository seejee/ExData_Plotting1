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

png("plot2.png", width=480, height=480)

plot(subset$DateTime,
     subset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )

dev.off()