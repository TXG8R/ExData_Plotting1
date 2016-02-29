# Designate file name
#fileName <- "Sample-household_power_consumption.txt"
fileName <- "household_power_consumption.txt"

# Read data into data frame with semicolon delimiter
x <- read.csv(fileName, sep = ";", na.strings="?", stringsAsFactors=F)

# Cast data types (from factors)
x$Date <- as.Date(x$Date, format="%d/%m/%Y")

# Capture only the dates in question
y <- x[which((x$Date == "2007-02-01" | x$Date == "2007-02-02")), ]

# Drop the large data set
rm(x)

# Convert time to date-time
y$Time <- as.POSIXct(paste(as.Date(y$Date), y$Time))

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(y, { 
    plot(Global_active_power ~ Time, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
    plot(Voltage ~ Time, type="l", ylab="Voltage (volt)", xlab="") 
    plot(Sub_metering_1 ~ Time, type="l", ylab="Global Active Power (kilowatts)", xlab="") 

    lines(Sub_metering_2 ~ Time,col='Red') 
    lines(Sub_metering_3 ~ Time,col='Blue') 

    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

    plot(Global_reactive_power ~ Time, type="l", ylab="Global Rective Power (kilowatts)",xlab="") 
   }) 

dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 
