setwd("~/Exploratory data analysis")
#fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileURL, destfile="electric_power_consumption.txt")
dat<-read.table("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2879, sep=";", na.strings="NA")
colnames(dat)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dat$Date<-as.Date(dat$Date,format= "%d/%m/%Y")
plot1<-hist(dat$Global_active_power, col="red",xlab="Global active power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()