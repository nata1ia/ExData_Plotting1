data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data[[1]] <- as.Date(data[[1]],"%d/%m/%Y")
data2 <- subset( data, data$Date == "2007-02-01" | data$Date == "2007-02-02") 

hist(data2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png") 
dev.off()