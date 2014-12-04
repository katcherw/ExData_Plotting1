# Project 1 of coursera explatory data analysis. Analyzes a range of days
# and makes a plot.
# Plot1 is the global active power histogram.

# user constants
startDateStr = "2007-02-01"
endDateStr = "2007-02-02"

# read data
dataAll <- read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";", 
                     na.strings = "?", 
                     stringsAsFactors = FALSE)

# convert date strings to Dates
dataAll$Date<-as.Date(dataAll$Date,"%d/%m/%Y")

# extract only rows within date range
data <- dataAll[dataAll$Date >= as.Date(startDateStr) &
                dataAll$Date <= as.Date(endDateStr),]

# make plot on screen
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# save to png
dev.copy(png, filename="plot1.png", width=480, height=480)
dev.off()
