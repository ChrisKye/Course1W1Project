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
png("plot2.png", width = 480, height = 480)

##Create a plot
plot(x = data1$dateTime, y = data1$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()