#Read data file
data<- "household_power_consumption.txt"
data5 <- read.table(data, sep=";",header = T, stringsAsFactors = F,dec="." )
#Selected dates
dodo <- data5[data5$Date %in% c("1/2/2007","2/2/2007"),]
#Plot + save
xo <- paste(dodo$Date,dodo$Time,sep=" ")
dateandtime <- strptime(xo,"%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(dodo$Sub_metering_1)
Sub_metering_2 <- as.numeric(dodo$Sub_metering_2)
Sub_metering_3 <- as.numeric(dodo$Sub_metering_3)

png("plot3.png")
plot(dateandtime,Sub_metering_1,type="l",ylab="Energy submetering",xlab="",color="black")
lines(dateandtime,Sub_metering_2,type="l",col="red")
lines(dateandtime,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()