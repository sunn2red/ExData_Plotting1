utility_df<-read.table("household_power_consumption.txt",skip=1,sep=';')
names(utility_df)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
utility_df<-subset(utility_df,utility_df$Date =="1/2/2007" |utility_df$Date=="2/2/2007")
utility_df$Date <- as.Date(utility_df$Date, format="%d/%m/%Y")
utility_df$Time <- strptime(utility_df$Time, format="%H:%M:%S")

utility_df[1:1440,"Time"] <- format(utility_df[1:1440,"Time"],"2007-02-01 %H:%M:%S")
utility_df[1441:2880,"Time"] <- format(utility_df[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# initiating a composite plot with many graphs
par(mfrow=c(2,2))


# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(utility_df,{
  plot(utility_df$Time,as.numeric(as.character(utility_df$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(utility_df$Time,as.numeric(as.character(utility_df$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(utility_df$Time,utility_df$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(utility_df,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(utility_df,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(utility_df,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(utility_df$Time,as.numeric(as.character(utility_df$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

