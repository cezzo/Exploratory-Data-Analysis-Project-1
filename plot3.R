setwd("~/Exploratory data analysis")
#fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileURL, destfile="electric_power_consumption.txt")
dat<-read.table("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2879, sep=";", na.strings="NA")
colnames(dat)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dat$Date<-as.Date(dat$Date,format= "%d/%m/%Y")
date_time<-paste0(as.Date(dat$Date),dat$Time)
dat$Date_time<-as.POSIXct(date_time)

plot3<-plot(Sub_metering_1~Date_time, data=dat, col="black", type="l",ylim=c(0,max(dat$Sub_metering_1)), ylab="Energy Sub Metering", xlab="")
lines(Sub_metering_2~Date_time, data=dat,col="red")
lines(Sub_metering_3~Date_time, data=dat, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, lwd=2.5, cex=.20)

dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()
