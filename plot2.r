# 0. read complete dataset
fulldata <- read.table(file="household_power_consumption.txt",
                       header=TRUE,sep=";",na.strings="?")

# 1. define date values for filtering ...
startdate <- as.Date("01/02/2007",format="%d/%m/%Y")
enddate <- as.Date("02/02/2007",format="%d/%m/%Y")
# ... and filter
dataFeb07 <- fulldata[(as.Date(fulldata$Date,format="%d/%m/%Y")==startdate 
                       | as.Date(fulldata$Date,format="%d/%m/%Y")==enddate),]

rm(fulldata)

# 1.2 create "full format" date for conversion to POSIX format
CompleteDate <- paste(as.character(dataFeb07$Date),as.character(dataFeb07$Time), sep=" ")
CompleteDate <- strptime(CompleteDate,format="%d/%m/%Y %H:%M:%S")

# Second plot: lines
# 2.1 open png device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# 2.2 create graph
plot(CompleteDate,dataFeb07$Global_active_power,
     main="",type="n",
     xlab="",ylab="Global Active Power (kilowatts)")
lines(CompleteDate,dataFeb07$Global_active_power)
# 2.3 close device
dev.off()