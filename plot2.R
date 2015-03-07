# D Stevenson
# March 2015
# This code Assignment 1, plot 2, for coursera course Exploratory Data Analysis
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
        "plot2.png",
        width     = 480,
        height    = 480,
)

#making plot
plot(x$dt, x$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()