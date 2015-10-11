col_classes = c("character", "character", "double", "double", "double", "double", "double")
d <- read.csv("household_power_consumption.txt", sep=";", colClasses=col_classes, na.strings="?")

# only need data of the following two days 
x1 <- subset(d, Date == '1/2/2007')
x2 <- subset(d, Date == '2/2/2007')
x <-rbind(x1,x2)

# create a new date time column from the date and time column 
x$DateTime <- strptime(paste(x$Date, x$Time), '%d/%m/%Y %H:%M:%S')

# plot to png 
png(filename="plot4.png", width=480, height=480)

# setup 4 plots in the same png 
par(mfrow = c(2,2))

# plot1 

plot(x$DateTime, x$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot 2

plot(x$DateTime, x$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot3
plot(x$DateTime, x$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(x$DateTime, x$Sub_metering_1, col="black")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), cex=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# plot 4

plot(x$DateTime, x$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
