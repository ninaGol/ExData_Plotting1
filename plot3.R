rm(list=ls())

library(lubridate)


w.dir <- "C:/Users/Nina/Documents/ExData_Plotting1"
setwd("C:/Users/Nina/Documents/ExData_Plotting1")


a <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
b <- a[as.character(a$Date) %in% c("1/2/2007", "2/2/2007"),]

b$Timestamp <- strptime(paste(b$Date, b$Time, sep= " "),"%d/%m/%Y %H:%M:%S")


# Plot 3
png("plot3.png")
plot(b$Timestamp, b$Sub_metering_1+b$Sub_metering_2+b$Sub_metering_3, type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0,40))
lines(b$Timestamp, b$Sub_metering_1, col = "black")
lines(b$Timestamp, b$Sub_metering_2, col = "red")
lines(b$Timestamp, b$Sub_metering_3, col = "blue")
legend("topright", col =  c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lty = 1)
dev.off()

