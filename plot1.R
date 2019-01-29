setwd("./R/ExploratoryDataAnalysis_C4W1/Assig1") # Change this path to any work directory of yours
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp <- tempfile() # creating a temporary NUL file for storing the zip file
download.file(url1, temp) # Down load the zip file and store it as an R object

#Unzipped the required files with fron the zip file Paths of the files to read
p1 <- unz(temp, "household_power_consumption.txt")
setwd("C:/Users/patil00s/Documents/R/ExploratoryDataAnalysis_C4W1/Assig1")
#p1 <- "C:/Users/patil00s/Documents/R/ExploratoryDataAnalysis_C4W1/Assig1/household_power_consumption.txt"
# Read data into a table
h2 <- read.table(p1, header = FALSE, sep = ";", stringsAsFactors = FALSE,
                 col.names = c("Date", "Time", "Global_active_power",
                               "Global_reactive_power","Voltage",
                               "Global_intensity", "Sub_metering_1",
                               "Sub_metering_2","Sub_metering_3"),
                 skip = 66637, nrows = 2880) # Skip first 66636 lines and then read the file
h2$Date <- paste(h2$Date, " ", h2$Time)
h2$Date <- as.POSIXct(h2$Date, format = "%d/%m/%Y %H:%M:%S")
png( filename = "plot1.png",
     width = 480, height = 480, units = "px",
     bg = "white")
hist(h2$Global_active_power, breaks = 15,col= "red", main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.off()

