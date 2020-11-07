library(data.table)

##Read data into R
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data <- as.data.table(data)

##Change date column to type "Date"
data$Date <- as.Date(data$Date, "%d/%m/%Y")

##Subset the two days
data1 <- data[(data$Date >= "2007-02-01") & (data$Date <= "2007-02-02"),]

##Create a PNG
png("plot1.png", width = 480, height = 480)

##Create histogram
hist(data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()