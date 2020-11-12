plot 4

> data<-read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
> my_dates<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
> my_dates$DateTime<-paste(my_dates$Date, my_dates$Time)
> my_dates$DateTime<-strptime(my_dates$DateTime, "%d/%m/%Y %H:%M:%S")
> my_dates$Date<-as.Date(my_dates$Date, "%d/%m/%Y")
> png("plot4.png", width=480, height=480)
> par(mfrow = c(2, 2))
> plot(my_dates$DateTime, my_dates$Global_active_power, type = "l", xlab = "",  ylab = "Global Active Power")
> plot(my_dates$DateTime, my_dates$Voltage, type = "l", xlab = "datetime",  ylab = "Voltage")
> plot(my_dates$DateTime, my_dates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
> lines(my_dates$DateTime, my_dates$Sub_metering_2, type = "l", col = "green")
> lines(my_dates$DateTime, my_dates$Sub_metering_3, type = "l", col = "purple")
> legend("topright", lty = c(1, 1, 1), col = c("black", "green", "purple"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), bty = "n")
> plot(my_dates$DateTime, my_dates$Global_reactive_power, type = "l", xlab = "datetime",  ylab = "Global_reactive_power")
> dev.off()
null device 
          1 
