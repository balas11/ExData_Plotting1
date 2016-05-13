#####
## Data prepared using shell commands after downloading
## head -1 household_power_consumption.txt > feb1n2in2007.txt
## grep '^[01 | 1 | 02 | 2]/[02 | 2]/2007' household_power_consumption.txt >> feb1n2in2007.txt
###
##Load File and create a DateTime variable
fp <- file.path(getwd(), "data", "feb1n2in2007.txt")
pcdf <- read.table(fp, header = TRUE, sep = ";", na.strings = "?")
pcdf$DateTime <- strptime(paste(pcdf$Date, pcdf$Time), "%d/%m/%Y %H:%M:%S")

##plot4.png
png(filename = "plot4.png")

##Plot
par(mfrow=c(2,2))
#r-1, c-1
plot(pcdf$DateTime, pcdf$Global_active_power, type = "l", ylab="Global Active Power", xlab = "")
#r-1, c-2
plot(pcdf$DateTime, pcdf$Voltage, type="l", ylab="Voltage", xlab="datetime")
#r-2, c-1 - copy from plot3
plot(pcdf$DateTime, pcdf$Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering")
points(pcdf$DateTime, pcdf$Sub_metering_2, type="l", col="red")
points(pcdf$DateTime, pcdf$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
#r-2, c-2
plot(pcdf$DateTime, pcdf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
##Cleanup
rm(pcdf)
dev.off()