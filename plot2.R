# Read in data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Open the screen device
png(file = 'plot2.png')

# Convert to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset only from two days
two_day_data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Convert individual Time points to DateTime
two_day_data$Time <- strptime(paste(two_day_data$Date, two_day_data$Time), "%Y-%m-%d %H:%M:%S")

# Draw line plot
plot(two_day_data$Time, as.numeric(two_day_data$Global_active_power), type = 'l', xlab = "", ylab = 'Global Active Power (kilowatts)')

# Close png
dev.off()