dataFile <- paste("C:/00-GUTIERRX/Coursera/04 - Exploratory Data Analysis/Data/",
                  "household_power_consumption.txt",sep="")
data <- read.table(dataFile,header=TRUE,sep=";",
                   stringsAsFactors=FALSE,na.strings="?",strip.white=TRUE)
data <- cbind(data[,1:2],data.frame(strptime(paste(data$Date,
                                                   data$Time),format="%d/%m/%Y %H:%M:%S")),data[,3:ncol(data)])
names(data)[3] <- "DateTime"
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(data2,
        {plot(DateTime,Global_active_power,xlab="",
                  ylab="Global Active Power (kilowatts)",type="l")
        plot(DateTime,Voltage,xlab="datetime",ylab="Voltage",type="l")
        {plot(DateTime,Sub_metering_1,xlab="",ylab="Energy Sub Metering",
                type="l")
        points(DateTime,Sub_metering_2,type="l",col="red")
        points(DateTime,Sub_metering_3,type="l",col="blue")
        legend("topright",lwd=1, lty=1,pch=c(NA,NA),col=c("black","red","blue"),
                legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
        plot(DateTime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
})
dev.off()