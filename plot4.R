# Read in data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Open the screen device
png(file = 'plot4.png')

# Set grid and margins
par(mfrow = c(2,2))
par(mar=c(4,4,2,2))

# Convert to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset only from two days
two_day_data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Convert individual Time points to DateTime
two_day_data$Time <- strptime(paste(two_day_data$Date, two_day_data$Time), "%Y-%m-%d %H:%M:%S")

# Draw plot from plot 2 
plot(two_day_data$Time, as.numeric(two_day_data$Global_active_power), type = 'l', xlab = "", ylab = 'Global Active Power')

# Draw second plot
plot(two_day_data$Time, as.numeric(two_day_data$Voltage), type = 'l', xlab = "datetime", ylab = 'Voltage')

# Draw line plot
plot(two_day_data$Time, as.numeric(two_day_data$Sub_metering_1), type = 'l', xlab = "", ylab = "Energy/ sub metering")

# Add a submetering 2 line
lines(two_day_data$Time, two_day_data$Sub_metering_2, col="red")

# Add a submetering 3 line
lines(two_day_data$Time, two_day_data$Sub_metering_3, col="blue")

# Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = 'n', lty = 1, col = c("black", "red", "blue"))

# Draw fourth plot
plot(two_day_data$Time, as.numeric(two_day_data$Global_reactive_power), type = 'l', xlab = "datetime", ylab = 'Global_reactive_power')

# Close png
dev.off()