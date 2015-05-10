# Read the data in r
 a<-read.table("household_power_consumption.txt",na.strings="?", header = TRUE, sep =";")
#subset the table to just the relevant dates
 b <- a[which(a$Date == "1/2/2007"|a$Date=="2/2/2007"),]

 #used in trouble shooting:
# b<-read.table("b.txt",na.strings="?", header = TRUE)

# create the histogram
hist(b$Global_active_power, col = "red",xlab="Global Active Power(kilowatts)", main ="Global Active Power")
dev.copy(png,"Plot1.png")
dev.off()