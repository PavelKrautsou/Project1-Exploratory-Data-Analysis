# Preparing the data
data <- read.table("household_power_consumption.txt",sep = ";",
 na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))
data$Date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

#making the plot
hist(data$Global_active_power, main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", col = "red" )

#making png file
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", col = "red" )
dev.off()
