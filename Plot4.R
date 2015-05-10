# Read the data in r
a<-read.table("household_power_consumption.txt",na.strings="?", header = TRUE, sep =";")
#subset the table to just the relevant dates
b <- a[which(a$Date == "1/2/2007"|a$Date=="2/2/2007"),]

#used in trouble shooting
#b<-read.table("b.txt",na.strings="?", header = TRUE)

b$day <- weekdays(as.Date(b$Date))
# create the plot
par(mfrow=c(2,2), oma=c(0,0,2,0))
par(mai=c(0.2,0.4,0.2,0))
#plot 2 Active Power
plot(b$Global_active_power,xlab= "",ylab="Global Active Power", type ="l", xaxt ="n")
lablist<-c("Thu", "Fri", "Sat")
axis(1, at=c(1, 1440, 2880), labels = lablist)

#voltage plot
plot(b$Voltage,xlab= "datetime",ylab="Global Active Power", type ="l", xaxt ="n")
lablist<-c("Thu", "Fri", "Sat")
axis(1, at=c(1, 1440, 2880), labels = lablist)

#plot 3 Sub_metering
plot(b$Sub_metering_1,xlab= "",ylab="Energy sub metering",type ="l", xaxt ="n", cex =2)
lines(b$Sub_metering_2,col ="red")
lines(b$Sub_metering_3,col ="blue")
lablist<-c("Thu", "Fri", "Sat")
axis(1, at=c(1, 1440, 2880), labels = lablist)
metering = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend = metering, lty=c(1,1,1),col=1:3)

plot(b$Global_reactive_power,xlab= "datetime",ylab="Global_reactive_power", type ="l", xaxt ="n")
lablist<-c("Thu", "Fri", "Sat")
axis(1, at=c(1, 1440, 2880), labels = lablist)

dev.copy(png,"Plot4.png")
dev.off()