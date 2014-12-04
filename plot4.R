# Project 1 of coursera explatory data analysis. Analyzes a range of days
# and makes a plot.
# Plot4 is a plot with 4 subplots 

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

# draw directly to png since legends will be screwed up if drawn on screen
png(filename="plot4.png", width=480, height=480)

# make 2x2 plot
par(mfrow=c(2,2))

# plot 1
plot(data$datetime, data$Global_active_power, type='l', xlab="", 
     ylab="Global Active Power (kilowatts)")

# plot 2
plot(data$datetime, data$Voltage, type='l', xlab="datetime", 
     ylab="Voltage")

# plot 3 
plot(data$datetime, data$Sub_metering_1, col="black", type="l", xlab="", 
     ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1), bty="n")

# plot 4
plot(data$datetime, data$Global_reactive_power, type='l', xlab="datetime", 
     ylab="global_reactive_power")

dev.off()
