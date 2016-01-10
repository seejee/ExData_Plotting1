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

png("plot1.png", width=480, height=480)

hist(subset$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()