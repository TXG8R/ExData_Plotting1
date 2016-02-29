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

#Plot 1
hist(y$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 

