#####
## Data prepared using shell commands after downloading
## head -1 household_power_consumption.txt > feb1n2in2007.txt
## grep '^[01 | 1 | 02 | 2]/[02 | 2]/2007' household_power_consumption.txt >> feb1n2in2007.txt
###
##Load File and create a DateTime variable
fp <- file.path(getwd(), "data", "feb1n2in2007.txt")
pcdf <- read.table(fp, header = TRUE, sep = ";", na.strings = "?")
pcdf$DateTime <- strptime(paste(pcdf$Date, pcdf$Time), "%d/%m/%Y %H:%M:%S")

##plot3.png
png(filename = "plot3.png")

##Plot
plot(pcdf$DateTime, pcdf$Sub_metering_1, type="l", col="black", xlab = "", ylab = "Energy sub metering")
points(pcdf$DateTime, pcdf$Sub_metering_2, type="l", col="red")
points(pcdf$DateTime, pcdf$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Cleanup
rm(pcdf)
dev.off()