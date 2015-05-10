# Read the data in r
a<-read.table("household_power_consumption.txt",na.strings="?", header = TRUE, sep =";")
#subset the table to just the relevant dates
b <- a[which(a$Date == "1/2/2007"|a$Date=="2/2/2007"),]

#used in trouble shooting
#b<-read.table("b.txt",na.strings="?", header = TRUE)

b$days <- weekdays(as.Date(b$Date))
# create the plot

plot(b$Global_active_power,xlab= "",ylab="Global Active Power", type ="l", xaxt ="n")

lablist<-c("Thu", "Fri", "Sat")
axis(1, at=c(1, 1440, 2880), labels = lablist)
dev.copy(png,"Plot2.png")
dev.off()
