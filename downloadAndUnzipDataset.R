# This script is used to download and unzip the file containing the dataset
# Both the archive and the unziped data are stored in the <./data> foler
#

# Check the current working folder
getwd()

# save the archive in the <./data> folder
if (!file.exists("data")) { dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/PowerConsumption.zip")

# store the list of the zipped files with path
# to be used later
listOfZippedFiles <- unzip("./data/PowerConsumption.zip", list=TRUE)
print(listOfZippedFiles[[1]])

# unzip the archive and store it in the <./data> folder
unzip("./data/PowerConsumption.zip",exdir="./data")

# show any file containing <readme> in its name
file.show(
    list.files(pattern="[rR][eE][aA][dD][mM][eE]", recursive=TRUE)
)