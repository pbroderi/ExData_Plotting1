# Read the data in r
a<-read.table("household_power_consumption.txt",na.strings="?", header = TRUE, sep =";")
#subset the table to just the relevant dates
b <- a[which(a$Date == "1/2/2007"|a$Date=="2/2/2007"),]

#used in trouble shooting
#b<-read.table("b.txt",na.strings="?", header = TRUE)

b$day <- weekdays(as.Date(b$Date))
# create the plot

plot(b$Sub_metering_1,xlab= "",ylab="Energy sub metering",type ="l", xaxt ="n")
lines(b$Sub_metering_2,col ="red")
lines(b$Sub_metering_3,col ="blue")


lablist<-c("Thu", "Fri", "Sat")
axis(1, at=c(1, 1440, 2880), labels = lablist)
metering = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend = metering, lty=c(1,1,1),col=1:3)
dev.copy(png,"Plot3.png")
dev.off()