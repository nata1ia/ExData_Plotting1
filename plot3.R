data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data[[1]] <- as.Date(data[[1]],"%d/%m/%Y")

Sys.setlocale("LC_TIME", "English")
data2 <- subset( data, data$Date == "2007-02-01" | data$Date == "2007-02-02") 
data2$weekday <- as.POSIXct(strftime(paste(data2$Date, data2$Time), tz="EST5EDT"))

with(data2, plot(weekday,Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="n"))
with(data2,lines(weekday,Sub_metering_1))
with(data2,lines(weekday,Sub_metering_2,col="red"))
with(data2,lines(weekday,Sub_metering_3,col="blue"))
legend("topright",    
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),     
       col=c("black", "red", "blue"),
       lty=c(1,1,1),cex = 0.6)
dev.copy(png, file = "plot3.png") 
dev.off()