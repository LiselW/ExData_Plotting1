#### Plot 1.R ####
# The below code results in a histogram of global active power.
setwd("C:/Users/310192577/Documents/Course/4_Exploratory Data Analysis/week 1")
install.packages('ggplot2')
library(ggplot2)

#reading the data
powerdata<-read.table('household_power_consumption.txt', header=TRUE, sep=';',stringsAsFactors = FALSE, skip=65939,nrow=30000)
colnames(powerdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#setting variable type
powerdata$Global_active_power<-as.numeric(powerdata$Global_active_power)
powerdata$Datetime<-paste(powerdata$Date, powerdata$Time, sep=" ")
powerdata$Datetime<- strptime(powerdata$Datetime, format="%d/%m/%Y %H:%M:%S")
powerdata$Datetime<-as.POSIXct(powerdata$Datetime)


#subsetting the data based on date
powerdata$dates<-as.Date(powerdata$Date, format="%d/%m/%Y")
Globalactivedata<-powerdata[powerdata$dates >= "2007-02-01" & powerdata$dates <= "2007-02-02",]

ggplot(data = Globalactivedata , aes(x = Datetime, y = Global_active_power))+
  geom_line() + 
  scale_x_datetime(breaks = date_breaks("1 days"),
                    labels=c("Thu","Fri","Sat")
                      )
                               

p<-qplot(x=Datetime, y=Global_active_power, data=Globalactivedata, geom="line")
p1<- p + scale_x_datetime(breaks = date_breaks("1 day"))

                               #c("Feb 01 00:00"="Thu", "Feb 02 00:00"="Fri", "Feb 03 00:00"= "Sat"))
("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00")
c("2007-02-01"="Thu","2007-02-02"= "Fri","2007-02-03" ="Sat")

#saving the histogram to PNG format
dev.copy(png,file=" plot1.png") # copy plot to PNG file
dev.off() #closes the PNG file



