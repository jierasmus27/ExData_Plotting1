# Read in data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Open the png graphics device
png(file = 'plot1.png')

# Convert to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset only from two days
two_day_data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Convert individual Time points to DateTime
two_day_data$Time <- strptime(paste(two_day_data$Date, two_day_data$Time), "%Y-%m-%d %H:%M:%S")

# Draw histogram
hist(as.numeric(two_day_data$Global_active_power), main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = "Frequency")

# Close png
dev.off()