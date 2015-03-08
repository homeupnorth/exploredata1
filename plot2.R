# Exploratory Data Analysis
# Project 1
# March 4, 2015
#
setwd("~/Documents/Coursera/Exploratory Data Analysis")
# download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# unzip in my working directory
# read into R
powerdata <- read.csv("~/Documents/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";")
# Data data is from the UC Irvine Machine Learning Repository, 
# “Individual household electric power consumption Data Set” 
# ===============================================================
#
#    I called my data 'powerdata', if you do too, then
#    the rest of the code you can run on your data 
#
# ================================================================
head(powerdata)   # see quick view of data
length(powerdata) # see how many components
str(powerdata)    # see structure, looking for data types
class(powerdata)  # see class making sure it is a data frame
names(powerdata)  # see names of fields to get spelling right
#
# Convert factors to numbers and date/time columns to date time field
#
powerdata$Global_active_power<-as.numeric(as.character(powerdata$Global_active_power))
powerdata$Global_reactive_power<-as.numeric(as.character(powerdata$Global_reactive_power))
powerdata$Voltage<-as.numeric(as.character(powerdata$Voltage))
powerdata$Global_intensity<-as.numeric(as.character(powerdata$Global_intensity))
powerdata$Sub_metering_1<-as.numeric(as.character(powerdata$Sub_metering_1))
powerdata$Sub_metering_2<-as.numeric(as.character(powerdata$Sub_metering_2))
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime<-strptime(powerdata$DateTime, "%d/%m/%Y %H:%M:%S")
#
# Check our conversions
#
summary(powerdata)
head(powerdata)
str(powerdata)  
#
# Pull subset for study and check our work
#
pdsubset<-subset(powerdata, powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007")
head(pdsubset)
str(pdsubset)
dim(pdsubset)
#
# Exploratory Graphs
#
par(mfrow=c(1,1))
# Plot 2
plot(pdsubset$DateTime, pdsubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.copy(png,filename="plot2.png");
dev.off()
par(mfrow=c(1,1))
#
#
#   All Done

