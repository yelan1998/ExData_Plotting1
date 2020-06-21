Sys.setlocale("LC_TIME", "English")

dat <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
nd <- subset(dat,Date>="2007-02-01" & Date<="2007-02-02")

nd <- nd[complete.cases(nd),]

newTime <- paste(nd$Date,nd$Time)
newTime <- setNames(newTime,"NewTime")
nd <- cbind(newTime,nd)
nd$newTime <- as.POSIXct(newTime)


par(mfrow=c(1,1))
plot(nd$newTime, nd$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()