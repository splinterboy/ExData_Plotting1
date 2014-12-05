#Read all data from .txt file
allData <- read.table("household_power_consumption.txt",sep=';',header=TRUE,dec='.',stringsAsFactors = F,na.strings = "?")

#Subset data for 2007-02-01 and 2007-02-02
subsetedData<-subset(allData, allData$Date %in%  c('1/2/2007','2/2/2007'))

#Make the plot
hist(subsetedData$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

#Create PNG file
dev.copy(png, file = "plot1.png")
dev.off()
