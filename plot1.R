# read in data set
data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")

# filter two days of interest
filtered_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# build histogram and store as png
png(filename = "plot1.png")
hist(filtered_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
