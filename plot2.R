#Set the repo to a default value
r <- getOption("repos")
r["CRAN"] <- "http://cran.us.r-project.org"
options(repos = r)
rm(r)

#Install and enable lubridate if not installed
packages <- c("lubridate")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

#Enable the library lubridate
library(lubridate)

#Read all data from .txt file
allData <- read.table("household_power_consumption.txt",sep=';',header=TRUE)

#Subset data for 2007-02-01 and 2007-02-02
subsetedData<-subset(allData, allData$Date %in%  c('1/2/2007','2/2/2007'))

#Change columns class for DateTime

#Paste Date/Time together
subsetedData$Date <- paste(subsetedData$Date, subsetedData$Time)
#Select only good columns
subsetedData <- subsetedData[,c(1,3:9)]
#Convert data with lubridate
subsetedData$Date<-dmy_hms(subsetedData$Date)

#Make the plot
plot(subsetedData$Date,subsetedData$Global_active_power,type="l", ylab='Global Active Power (kilowatts)',xlab='')

#Create PNG file
dev.copy(png, file = "plot2.png")
dev.off()
