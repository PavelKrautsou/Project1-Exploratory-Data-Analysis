#Preparing the data
data <- read.table("household_power_consumption.txt",sep = ";",
 na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data, (data$Date == "2007-02-01" | data$Date == "2007-02-02"))
data$Date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")


# setting the locale
# works fine on Windows
Sys.setlocale("LC_TIME", "English") 

#making the plot
with(data, plot(Date,Global_active_power, type = "l",
 ylab = "Global Active Power (kilowatts)"))


#making png file
png("plot2.png")
with(data, plot(Date,Global_active_power, type = "l",
 ylab = "Global Active Power (kilowatts)"))
dev.off()