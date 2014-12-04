# Project 1 of coursera explatory data analysis. Analyzes a range of days
# and makes a plot.
# Plot2 is th global active power over time over the date range.

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
plot(data$datetime, data$Global_active_power, type='l', xlab="", 
     ylab="Global Active Power (kilowatts)")

# save to png
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()
