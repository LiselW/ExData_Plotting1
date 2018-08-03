#### Plot 1.R ####
# The below code results in a histogram of global active power.
setwd("C:/Users/310192577/Documents/Course/4_Exploratory Data Analysis/week 1")
install.packages('ggplot2')
library(ggplot2)

#reading the data
powerdata<-read.table('household_power_consumption.txt', header=TRUE, sep=';',stringsAsFactors = FALSE, skip=65939,nrow=30000,col.names=powernames)
colnames(powerdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#setting variable type
powerdata$Global_active_power<-as.numeric(powerdata$Global_active_power)
powerdata$Date<-as.Date(powerdata$Date, format="%d/%m/%Y")

#subsetting the data based on date
Globalactivedata<-powerdata[powerdata$Date >= "2007-02-01" & powerdata$Date <= "2007-02-02",]

#Creating the histogram
image<-hist(Globalactivedata$Global_active_power, col="red", xlab=" Global Active Power (kilowatts)", ylab= " Frequency", main="Global Active Power", width=480,height=480)

#saving the histogram to PNG format
dev.copy(png,file=" plot1.png") # copy plot to PNG file
dev.off() #closes the PNG file
