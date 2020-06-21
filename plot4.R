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
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma = c(0,0,2,0))
  plot(newTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(newTime,Voltage, type ="l", ylab = "Voltage (volt)", xlab="")
  plot(newTime,Sub_metering_1, type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(newTime,Sub_metering_2, col = 'Red')
  lines(newTime,Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(newTime,Global_reactive_power, type = "l", ylab = "Global Rective Power (kilowatts)",xlab = "")
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()