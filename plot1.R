## This script is used to plot and save <plot1.png>
###################################################

# Check the current working folder
getwd()

# check if the data file is present in the the <./data> folder
# if not, download the archive into the <./data> folder
#         and unpack it
if (!file.exists("data/household_power_consumption.txt"))
{
    source("downloadAndUnzipDataset.R")
}

# load data from the file and limit to only the dates we are interested in
source("loadOnlyNecessaryDataFromDataset.R")

# initializing graphics device
# could be done with dev.off() or
# could be done with dev.new()
dev.new(); myGraphDev <- dev.cur() 
# if one wants, this device can be closed later with dev.off()

# plot 1 (histogram)
hist(housePCDFlimited$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power"
     )

# copy the plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
# close the PNG device!
dev.off()

# close the screen device
dev.off(myGraphDev); rm(myGraphDev)
