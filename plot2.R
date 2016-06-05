data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")

# filter two days of interest
filtered_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# convert date and time to date time
filtered_data['DateTime'] <- as.POSIXct(strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S"))

# build graph and store as png
png(filename = "plot2.png")
plot(filtered_data$DateTime, filtered_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(filtered_data$DateTime, filtered_data$Global_active_power)
dev.off()
