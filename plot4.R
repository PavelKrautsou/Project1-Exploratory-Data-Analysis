# Preparing the data
data <- read.table("household_power_consumption.txt",sep = ";",
 na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))
data$Date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

# setting the locale
# works fine on Windows
Sys.setlocale("LC_TIME", "English") 

#making the plot
par(mfrow = c(2,2))
with(data, plot(Date,Global_active_power, type = "l",
 ylab = "Global Active Power (kilowatts)"))
with(data, plot(Date,Voltage, type = "l",
 xlab = "datetime"))
plot(data$Date,data$Sub_metering_1, type = "l",
 ylab = "Energy sub metering", xlab = "")
lines(data$Date,data$Sub_metering_2, type = "l", col = "red")
lines(data$Date,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red","blue"),
 legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
 bty = "n")
with(data, plot(Date,Global_reactive_power, type = "l",
 xlab = "datetime"))

#making png file
png("plot4.png")
par(mfrow = c(2,2))
with(data, plot(Date,Global_active_power, type = "l",
 ylab = "Global Active Power (kilowatts)"))
with(data, plot(Date,Voltage, type = "l",
 xlab = "datetime"))
plot(data$Date,data$Sub_metering_1, type = "l",
 ylab = "Energy sub metering", xlab = "")
lines(data$Date,data$Sub_metering_2, type = "l", col = "red")
lines(data$Date,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red","blue"),
 legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
 bty = "n")
with(data, plot(Date,Global_reactive_power, type = "l",
 xlab = "datetime"))
dev.off()

