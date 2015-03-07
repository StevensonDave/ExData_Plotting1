# D Stevenson
# March 2015
# This code Assignment 1, plot 4, for coursera course Exploratory Data Analysis
# A description of the data is included in the README.md
# This code assumes the working directory is the same location of "household_power_consumption.txt"

#Read data
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
library(lubridate)
library(dplyr)
x$Date <- dmy(x$Date)


#subset data to only select the 2007-02-01 and 2007-02-02
x <- filter(x, Date > "2007-01-31")
x <- filter(x, Date < "2007-02-02")

x$Time <- hms(x$Time)
x <- mutate(x, dt = Date + Time)

#specify png graphics device
png(
        "plot4.png",
        width     = 480,
        height    = 480,
)

#making plot
par(mfcol = c(2,2))

plot(x$dt, x$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

with(x, {
        plot(dt, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
        lines(dt, Sub_metering_2, type = "l", col = "Red")
        lines(dt, Sub_metering_3, type = "l", col = "Blue")
})

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

plot(x$dt, x$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(x$dt, x$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()