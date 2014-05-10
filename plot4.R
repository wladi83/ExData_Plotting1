png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
myTable<-read.table("household_power_consumption.txt",sep=";",header=T)
myTable1<-subset(myTable,Date=="1/2/2007" | Date=="2/2/2007")
date.Time<-strptime(paste(myTable1$Date,myTable1$Time),"%d/%m/%Y %H:%M:%S")
myTable2<-cbind(myTable1,date.Time)

with(myTable2,plot(date.Time,as.numeric(as.character(Global_active_power)),type="l",ylab="Global Active Power",xlab=""))

with(myTable2,plot(date.Time,as.numeric(as.character(Voltage)),type="l",ylab="Voltage",xlab="datetime"))

plot(myTable2$date.Time,as.numeric(as.character(myTable2$Sub_metering_1)),type="l",col="black",xlab="",ylab="Energy sub metering")
lines(myTable2$date.Time,as.numeric(as.character(myTable2$Sub_metering_2)),type="l",col="red",xlab="",ylab="")
lines(myTable2$date.Time,as.numeric(as.character(myTable2$Sub_metering_3)),type="l",col="blue",ylab="",xlab="")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(myTable2,plot(date.Time,as.numeric(as.character(Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="datetime"))

dev.off()