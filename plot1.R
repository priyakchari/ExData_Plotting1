##Upload file, create data frame and manipulate numeric fields
file <- "household_power_consumption.txt"
power <- read.table(file, header=TRUE, sep=";",na.strings="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

## Create a histogram to show Global Active Power and 
## save to a plot1.png file with transparent background (per file in Github)
png("plot1.png",width=480,height=480,bg="transparent")
hist(df$Global_active_power, col="RED",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
