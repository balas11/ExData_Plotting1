#####
## Data prepared using shell commands after downloading
## head -1 household_power_consumption.txt > feb1n2in2007.txt
## grep '^[01 | 1 | 02 | 2]/[02 | 2]/2007' household_power_consumption.txt >> feb1n2in2007.txt
###
##Load File and create a DateTime variable
fp <- file.path(getwd(), "data", "feb1n2in2007.txt")
pcdf <- read.table(fp, header = TRUE, sep = ";", na.strings = "?")
pcdf$DateTime <- strptime(paste(pcdf$Date, pcdf$Time), "%d/%m/%Y %H:%M:%S")

##Plot the data for plot1.png
png(filename = "plot1.png")

##Plot
hist(pcdf$Global_active_power,breaks = 13, col = "red",
     main="Global Active Power", xlab="Global Active Power(Kilowatts)", ylab = "Frequency")

##Cleanup
rm(pcdf)
dev.off()