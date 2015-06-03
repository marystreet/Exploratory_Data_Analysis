plot2 <- function(){
    ## Read in the datafile, convert the date format, then subset to the correct dates
    setwd("~/Desktop/Coursera/ExData")
    rawdata <- read.csv("household_power_consumption.txt", header = T, 
                        sep = ";",na.strings = "?",check.names=F, stringsAsFactors=F, 
                        comment.char="", quote='\"')
    rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
    subdata <- subset(rawdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
    ## Format the date/time and append to the data
    convdate <- strptime(paste(subdata[,1], subdata[,2]), "%Y-%m-%d %H:%M:%S")
    plotdata <- cbind(subdata, convdate)
    
    ## Build the plot in the PNG file
    png(filename="Plot2.png", width=480, height=480)
    plot(plotdata$convdate, plotdata$Global_active_power, 
         type="l", ylab="Global Active Power (kilowatts)",
         xlab="")
    dev.off()
    
}