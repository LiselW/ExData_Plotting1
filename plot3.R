#### Plot 3.R ####
# The below code results in a histogram of global active power.
setwd("C:/Users/310192577/Documents/Course/4_Exploratory Data Analysis/week 1")
install.packages('ggplot2')
library(ggplot2)
library(scales)

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
Globalactivedata$sub_metering_1<-as.factor(Globalactivedata$Sub_metering_1)



#create the plot
ggplot(data = Globalactivedata , aes(x = Datetime)) +
  geom_line(aes(y=Sub_metering_1, color="Sub_metering_1")) +
  geom_line(aes(y=Sub_metering_2, color="Sub_metering_2")) +
  geom_line(aes(y=Sub_metering_3, color="Sub_metering_3")) +
  scale_colour_manual(values=c("Black","Red", "Blue"))+
  scale_x_datetime(breaks = date_breaks("1 days"),labels=date_format("%a", tz="CET"))+
  labs(x=" ", y="Energy sub metering")+
  theme(legend.position = c(0.9,0.96), legend.title=element_text(""))
  
  
  #saving the histogram to PNG format
  dev.copy(png,file=" plot3.png") # copy plot to PNG file
dev.off() #closes the PNG file
