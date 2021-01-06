rm(list=ls())

library(lubridate)


w.dir <- "C:/Users/Nina/Documents/ExData_Plotting1"
setwd("C:/Users/Nina/Documents/ExData_Plotting1")


a <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
b <- a[as.character(a$Date) %in% c("1/2/2007", "2/2/2007"),]

b$Timestamp <- strptime(paste(b$Date, b$Time, sep= " "),"%d/%m/%Y %H:%M:%S")



png("plot4.png")
par(mar=c(4,4,2,2), mfrow = c(2,2))
# Plot 1
plot(b$Timestamp, b$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Plot 2
plot(b$Timestamp, b$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Plot 3
plot(b$Timestamp, b$Sub_metering_1+b$Sub_metering_2+b$Sub_metering_3, type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0,40))
lines(b$Timestamp, b$Sub_metering_1, col = "black")
lines(b$Timestamp, b$Sub_metering_2, col = "red")
lines(b$Timestamp, b$Sub_metering_3, col = "blue")
legend("topright", col =  c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty = 1, bty = "n")

# Plot 4
plot(b$Timestamp, b$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()