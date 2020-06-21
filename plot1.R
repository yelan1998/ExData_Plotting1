dat <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
nd <- subset(dat,Date>="2007-02-01" & Date<="2007-02-02")

nd <- nd[complete.cases(nd),]

newTime <- paste(nd$Date,nd$Time)
newTime <- setNames(newTime,"NewTime")
nd <- cbind(newTime,nd)
nd$newTime <- as.POSIXct(newTime)



par(mfrow=c(1,1))
hist(nd$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()