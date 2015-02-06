##Load Data
mydata = read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

##Assign column names
colnames(mydata)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

##Subset
newdata <-mydata[which(as.Date(mydata$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(mydata$Date, "%d/%m/%Y")=="2007-02-02"),]

##Assign column names
colnames(newdata)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

##Add new DateTime column
newdata$DateTime <-strptime(paste(newdata$Date,newdata$Time), "%d/%m/%Y %H:%M:%S")

##Plot 3
with(newdata, plot(DateTime,Sub_metering_1, type="l", ylab = "Energy Sub Metering", col="grey"))
points(newdata$DateTime, newdata$Sub_metering_2, type="l", col="red")
points(newdata$DateTime, newdata$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col =c("grey", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 



##Generate PNG file
dev.copy(png, file = "plot3.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
