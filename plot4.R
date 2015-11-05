
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data[[1]] <- as.Date(data[[1]],"%d/%m/%Y")

Sys.setlocale("LC_TIME", "English")
data2 <- subset( data, data$Date == "2007-02-01" | data$Date == "2007-02-02") 
data2$weekday <- as.POSIXct(strftime(paste(data2$Date, data2$Time), tz="EST5EDT"))

par(mfrow=c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
with(data2,{
        plot(weekday,Global_active_power,main="",ylab="Global Active Power",xlab="",type="n")
        lines(weekday,Global_active_power,main="",ylab="Global Active Power",xlab="")
        
        plot(weekday,Voltage,main="",ylab="Voltage",xlab="datetime",type="n")
        lines(weekday,Voltage,main="",ylab="Voltage",xlab="datetime")
        
        plot(weekday,Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="n")
        lines(weekday,Sub_metering_1,main="",ylab="Energy sub metering",xlab="")
        lines(weekday,Sub_metering_2,col="red")
        lines(weekday,Sub_metering_3,col="blue")
        legend("topright",    
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),     
               col=c("black", "red", "blue"),
               lty=1, cex = 0.6)
        plot(weekday,Global_reactive_power,main="",ylab="Global_reactive_power",xlab="datetime",type="n")
        lines(weekday,Global_reactive_power,main="",ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, file = "plot4.png") 
dev.off()