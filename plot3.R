# Project 1 of coursera explatory data analysis. Analyzes a range of days
# and makes a plot.
# Plot3 is the energy sub metering over time over the date range.

# user constants
startDateStr = "2007-02-01"
endDateStr = "2007-02-03"

# read data
dataAll <- read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";", 
                     na.strings = "?", 
                     stringsAsFactors = FALSE)

# convert date strings to Dates
dataAll$datetime<-strptime(paste(dataAll$Date, dataAll$Time),"%d/%m/%Y %H:%M:%S")

# extract only rows within date range
data <- dataAll[dataAll$datetime >= startDateStr &
                dataAll$datetime < endDateStr,]

# make plot on screen
plot(data$datetime, data$Sub_metering_1, col="black", type="l", xlab="", 
     ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1))

# save to png
dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off()
