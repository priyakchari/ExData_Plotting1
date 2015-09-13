##Upload file, create data frame and manipulate numeric fields
file <- "household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";",na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

## Create plot and lines for showing Sub_metering 1, 2 and 3 and 
## save to a plot3.png file with transparent background (per file in Github)
png("plot3.png",width=480,height=480,bg="transparent")
plot(df$timestamp,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend('topright',lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()