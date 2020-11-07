library(data.table)

##Read data into R
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data <- as.data.table(data)

##Create dateTime column
data$dateTime <- data[,as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

##Subset the two days
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- data[(data$Date >= "2007-02-01") & (data$Date <= "2007-02-02"),]

##Create a PNG
png("plot3.png", width = 480, height = 480)

##Create a plot
plot(data1$dateTime, data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data1$dateTime, data1$Sub_metering_2, col = "red")
lines(data1$dateTime, data1$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1))

dev.off()