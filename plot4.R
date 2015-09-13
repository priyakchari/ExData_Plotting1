##Upload file, create data frame and manipulate numeric fields
file <- "household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";",na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

##Create 4 plots to be arranged in 2 by 2 matrix and 
##save to a plot4.png file with transparent background (per file in Github)
png("plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2))
plot(df$timestamp,df$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(df$timestamp,df$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(df$timestamp,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend('topright',bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df$timestamp,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
