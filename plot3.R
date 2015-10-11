col_classes = c("character", "character", "double", "double", "double", "double", "double")
d <- read.csv("household_power_consumption.txt", sep=";", colClasses=col_classes, na.strings="?")

# only need data for the following two days 
x1 <- subset(d, Date == '1/2/2007')
x2 <- subset(d, Date == '2/2/2007')
x <-rbind(x1,x2)

# concatenate the date and time together to form a new column of date time 
x$DateTime <- strptime(paste(x$Date, x$Time), '%d/%m/%Y %H:%M:%S')

# plot to png 
png(filename="plot3.png", width=480, height=480)

# setup the plot 
plot(x$DateTime, x$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

# add the lines 
lines(x$DateTime, x$Sub_metering_1, col="black")
lines(x$DateTime, x$Sub_metering_2, col="red")
lines(x$DateTime, x$Sub_metering_3, col="blue")

legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
