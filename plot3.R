Sys.setlocale("LC_TIME", "English")

dat <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
nd <- subset(dat,Date>="2007-02-01" & Date<="2007-02-02")

nd <- nd[complete.cases(nd),]

newTime <- paste(nd$Date,nd$Time)
newTime <- setNames(newTime,"NewTime")
nd <- cbind(newTime,nd)
nd$newTime <- as.POSIXct(newTime)


with(nd, {
  par(mfrow=c(1,1))
  plot(newTime,Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(newTime,Sub_metering_2, col='Red')
  lines(newTime,Sub_metering_3, col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()