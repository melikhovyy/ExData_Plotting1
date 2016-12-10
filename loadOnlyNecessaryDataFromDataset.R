## This script is used to load only necessary points from huge dataset file
###########################################################################

# knowing that data are recorded in 1 min interval
# let's estimate how many rows one need to extract 
# in order to cover 1/2/2007 and 2/2/2007

# the first date of collection is
housePCDF <- read.csv("data/household_power_consumption.txt",
                      header=1,
                      sep=";",
                      na.strings="?",
                      nrows=1
)
firstDate <- strptime(housePCDF$Date, format="%d/%m/%Y")
# the last date of collection (for us) is
lastDate  <- strptime("2/2/2007", format="%d/%m/%Y")

# total number of collected data points, i.e. total number of minutes:
numberOfRows <- as.integer((lastDate - firstDate + 1))*24*60

# the first date of collection is
housePCDF <- read.csv("data/household_power_consumption.txt",
                      header=1,
                      sep=";",
                      na.strings="?",
                      nrows=numberOfRows
)

# extract info from the huge data for only selected dates
housePCDFlimited <- subset(housePCDF, housePCDF$Date=="1/2/2007" | housePCDF$Date=="2/2/2007")
# remove the huge data from the RAM memory and also
# remove other unnecessary variables
rm(housePCDF, numberOfRows, firstDate, lastDate)

# combine date and time from separate columns into one column
housePCDFlimited$combinedDateTime <- as.POSIXct(
    strptime(paste(housePCDFlimited$Date, housePCDFlimited$Time),format="%d/%m/%Y %H:%M:%S")
)
