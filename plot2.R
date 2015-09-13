##Upload file, create data frame and manipulate numeric fields
file <- "household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";",na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## Create a line plot to show Global Active Power by days and 
## save to a plot2.png file with transparent background (per file in Github)
png("plot2.png",width=480,height=480,bg="transparent")
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
