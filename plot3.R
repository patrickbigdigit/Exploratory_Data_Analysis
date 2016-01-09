## R script for plot 3

# Initial file assignment and data retrival. 

file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subsetting to limit for two days of data
s_data <- subset(data,data$Date %in% c("1/2/2007","2/2/2007") )

# converting to numeric for the global active power variable
#s_data$Global_active_power <- as.numeric(s_data$Global_active_power)
s_data$Sub_metering_1 <- as.numeric(s_data$Sub_metering_1)
s_data$Sub_metering_2 <- as.numeric(s_data$Sub_metering_2)
s_data$Sub_metering_3 <- as.numeric(s_data$Sub_metering_3)

# class(s_data$Sub_metering_1) 

# combining date and time values and coverting to datetime format to plot the chart against this variable.

var_dt_time <- strptime(paste(s_data$Date, s_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# opening the PNG package

png("plot3.png", width=480, height=480)

# type l for line. Calling a based plot chart and adding second and third line for remaining variables.

plot(var_dt_time, s_data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")

lines(var_dt_time, s_data$Sub_metering_2, type="l", col="red")
lines(var_dt_time, s_data$Sub_metering_3, type="l", col="blue")

# calling legends as topright corner in chart

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lwd=2, lty=1,col=c("black", "red", "blue"))

dev.off()

