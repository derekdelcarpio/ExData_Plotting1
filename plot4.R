data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")

# filter two days of interest
filtered_data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

# convert date and time to date time
filtered_data['DateTime'] <- as.POSIXct(strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S"))

# build graph and store as png
png(filename = "plot4.png")

# set up 2 by 2 panels
par(mfrow = c(2,2))

# top left panel
plot(filtered_data$DateTime, filtered_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(filtered_data$DateTime, filtered_data$Global_active_power)

# top right panel
plot(filtered_data$DateTime, filtered_data$Voltage, xlab = "datetime", ylab = "Voltage", type="n")
lines(filtered_data$DateTime, filtered_data$Voltage)

# bottom left panel
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n")
lines(filtered_data$DateTime, filtered_data$Sub_metering_1)
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# bottom right panel
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="n")
lines(filtered_data$DateTime, filtered_data$Global_reactive_power)

dev.off()
