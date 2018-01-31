#Plot2

library(dplyr)

#Set locale computer language in English
Sys.setlocale(locale = "English")

## Create and set working directory:
if (!file.exists("Course Project 1")){
  dir.create("Course Project 1")
  setwd("./Course Project 1")
}

## Download the dataset:
if (!file.exists("Electric power consumption.zip")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL,"Electric power consumption.zip")
}

## Unzip the dataset:
if (!file.exists("household_power_consumption.txt")) { 
  unzip("Electric power consumption.zip") 
}

# Import all data for 9 variables in the dataset:
Data_all <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
Data_Use <- Data_all %>%
            filter(Date == "1/2/2007" | Date == "2/2/2007")
Data_Time <- strptime(paste(Data_Use$Date, Data_Use$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot2
png("plot2.png", width=480, height=480)
plot(Data_Time, as.numeric(Data_Use$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()