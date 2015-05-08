data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?",strip.white=TRUE)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
