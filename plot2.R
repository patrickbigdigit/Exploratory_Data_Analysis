## R script for plot 2

# Initial file assignment and data retrival. 

file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subsetting to limit for two days of data
s_data <- subset(data,data$Date %in% c("1/2/2007","2/2/2007") )

# converting to numeric for the global active power variable
s_data$Global_active_power <- as.numeric(s_data$Global_active_power)
#s_data$Date <- as.Date(s_data$Date,"%d/%m/%y")

# combining date and time values and coverting to datetime format to plot the chart against this variable.

var_dt_time <- strptime(paste(s_data$Date, s_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# opening the PNG package

png("plot2.png", width=480, height=480)

# type l for line. Calling a based plot chart

plot(var_dt_time, s_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#dev. off

dev.off()