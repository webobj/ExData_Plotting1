col_classes = c("character", "character", "double", "double", "double", "double", "double")
d <- read.csv("household_power_consumption.txt", sep=";", colClasses=col_classes, na.strings="?")

# only need data for the following two days 
x1 <- subset(d, Date == '1/2/2007')
x2 <- subset(d, Date == '2/2/2007')
x <-rbind(x1,x2)

# plot to png 
x$DateTime <- strptime(paste(x$Date, x$Time), '%d/%m/%Y %H:%M:%S')
png(filename="plot2.png", width=480, height=480)
plot(x$DateTime, x$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
