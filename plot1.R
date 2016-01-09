## R script for plot 1

# Initial file assignment and data retrival. 
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subsetting to limit for two days of data
s_data <- subset(data,data$Date %in% c("1/2/2007","2/2/2007") )

# converting to numeric for the global active power variable
s_data$Global_active_power <- as.numeric(s_data$Global_active_power)

# The histogram
png(file="plot1.png",width=480,height=480) # open ploting device

hist(s_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off() # close ploting device

