## This script is used to plot and save <plot3.png>
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

# plot 3
with(housePCDFlimited,
     plot(Sub_metering_1 ~ combinedDateTime,
          type="n",
          xlab="", 
          ylab="Energy sub metering")
     )
with(housePCDFlimited,
     lines(Sub_metering_1 ~ combinedDateTime, 
           lty="solid",
           col="black"
          )
     )
with(housePCDFlimited,
     lines(Sub_metering_2 ~ combinedDateTime, 
           lty="solid",
           col="red"
           )
     )
with(housePCDFlimited,
     lines(Sub_metering_3 ~ combinedDateTime, 
           lty="solid",
           col="blue"
     )
)
legend("topright",
       lty=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ## Honestly, I had problems with the width of my legend
       ## The width is different (!!!) when I modify the size of my
       ##    figure window in RStudio (!!!)
       ## In case I used window() the size of my legend was small to
       ##    disply the full names (!!!)
       ## I assume that strwidth command that identifies the width for the legend
       ##    does not do its job properly
       ## Hence I use this command 
       , text.width=50000
)

# copy the plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
# close the PNG device!
dev.off()

# close the screen device
dev.off(myGraphDev); rm(myGraphDev)
