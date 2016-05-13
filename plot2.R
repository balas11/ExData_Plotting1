#####
## Data prepared using shell commands after downloading
## head -1 household_power_consumption.txt > feb1n2in2007.txt
## grep '^[01 | 1 | 02 | 2]/[02 | 2]/2007' household_power_consumption.txt >> feb1n2in2007.txt
###
##Load File and create a DateTime variable
fp <- file.path(getwd(), "data", "feb1n2in2007.txt")
pcdf <- read.table(fp, header = TRUE, sep = ";", na.strings = "?")
pcdf$DateTime <- strptime(paste(pcdf$Date, pcdf$Time), "%d/%m/%Y %H:%M:%S")

##plot2.png
png(filename = "plot2.png")

##Plot
plot(pcdf$DateTime, pcdf$Global_active_power, type = "l", ylab="Global Active Power(Kilowatts)", xlab = "")

##Cleanup
rm(pcdf)
dev.off()