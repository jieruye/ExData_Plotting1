#Getting full data
Full_Data <- read.csv("./Data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=FALSE, comment.char="", quote='\"')
Full_Data$Date <- as.Date(Full_Data$Date, format="%d/%m/%Y")

#Subsetting Data
Subset_Data <- subset(Full_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
globalActivePower <- as.numeric(Subset_Data$Global_active_power)
globalReactivePower <- as.numeric(Subset_Data$Global_reactive_power)
Voltage <- as.numeric(Subset_Data$Voltage)
Sub_metering_1 <- as.numeric(Subset_Data$Sub_metering_1)
Sub_metering_2 <- as.numeric(Subset_Data$Sub_metering_2)
Sub_metering_3 <- as.numeric(Subset_Data$Sub_metering_3)

#Converting dates
datetime <- paste(as.Date(Subset_Data$Date), Subset_Data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot 2
plot(globalActivePower, datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Saving to file
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()