rm(list=ls())

library(lubridate)


w.dir <- "C:/Users/Nina/Documents/ExData_Plotting1"
setwd("C:/Users/Nina/Documents/ExData_Plotting1")


a <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
b <- a[as.character(a$Date) %in% c("1/2/2007", "2/2/2007"),]

b$Timestamp <- strptime(paste(b$Date, b$Time, sep= " "),"%d/%m/%Y %H:%M:%S")

# Plot 1

png("plot1.png")
hist(b$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

