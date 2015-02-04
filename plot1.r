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

# 2. First plot: histogram
# 2.1 open png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# 2.2 create histogram
hist(dataFeb07$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
# 2.3 close device
dev.off()