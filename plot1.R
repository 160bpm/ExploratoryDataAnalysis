##Load Data
mydata = read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

##Assign column names
colnames(mydata)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

##Subset
newdata <-mydata[which(as.Date(mydata$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(mydata$Date, "%d/%m/%Y")=="2007-02-02"),]

##Assign column names
colnames(newdata)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3" )

##Plot 1
hist(newdata$Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red",)

##Generate PNG file
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
