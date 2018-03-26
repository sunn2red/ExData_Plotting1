# Unzip dataSet to /data directory
unzip(zipfile="./Dataset.zip",)
utility_df<-read.table("household_power_consumption.txt",skip=1,sep=';')
names(utility_df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
utility_df<-subset(utility_df,utility_df$Date =="1/2/2007" |utility_df$Date=="2/2/2007")
hist(as.numeric(as.character(utility_df$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)")
title(main="Global Active Power")
