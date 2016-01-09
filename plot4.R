## R script for plot 3

# Initial file assignment and data retrival. 

file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subsetting to limit for two days of data

s_data <- subset(data,data$Date %in% c("1/2/2007","2/2/2007") )

# converting to all required variables to numeric class. 

s_data$Global_active_power <- as.numeric(s_data$Global_active_power)
s_data$Sub_metering_1 <- as.numeric(s_data$Sub_metering_1)
s_data$Sub_metering_2 <- as.numeric(s_data$Sub_metering_2)
s_data$Sub_metering_3 <- as.numeric(s_data$Sub_metering_3)
s_data$globalReactivePower <- as.numeric(s_data$Global_reactive_power)
s_data$voltage <- as.numeric(s_data$Voltage)


# combining date and time values and coverting to datetime format to plot the chart against this variable.

var_dt_time <- strptime(paste(s_data$Date, s_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Opening a chart for plotting and updating mfrow for 2*2 array

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

# Ploting all four graphs as per the requirement

plot(var_dt_time, s_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(var_dt_time, s_data$voltage, type="l", xlab="datetime", ylab="Voltage")

plot(var_dt_time, s_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(var_dt_time, s_data$Sub_metering_2, type="l", col="red")
lines(var_dt_time, s_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

plot(var_dt_time, s_data$globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()