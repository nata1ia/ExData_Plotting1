
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data[[1]] <- as.Date(data[[1]],"%d/%m/%Y")

Sys.setlocale("LC_TIME", "English")
data2 <- subset( data, data$Date == "2007-02-01" | data$Date == "2007-02-02") 
data2$weekday <- as.POSIXct(strftime(paste(data2$Date, data2$Time), tz="EST5EDT"))

with(data2, plot(weekday,Global_active_power,main="",ylab="Global Active Power (kilowatts)",xlab="",type="n"))
with(data2,lines(weekday,Global_active_power))
dev.copy(png, file = "plot2.png") 
dev.off()
