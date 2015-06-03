plot3 <- function(){
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
    png(filename="Plot3.png", width=480, height=480)
    with(plotdata, plot(convdate,Sub_metering_1,ylab="Energy sub metering",
        xlab = "", type="l", col="black"
        ))
    lines(plotdata$convdate, plotdata$Sub_metering_2, col="red")
    lines(plotdata$convdate, plotdata$Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))                    
    dev.off()
    
}