#Read data file
data<- "household_power_consumption.txt"
data5 <- read.table(data, sep=";",header = T, stringsAsFactors = F,dec="." )
#Selected dates
dodo <- data5[data5$Date %in% c("1/2/2007","2/2/2007"),]
#Plot + save
xo <- paste(dodo$Date,dodo$Time,sep=" ")
dateandtime <- strptime(xo,"%d/%m/%Y %H:%M:%S")

Active <- as.numeric(dodo$Global_active_power)

voltage <- as.numeric(dodo$Voltage)

Sub_metering_1 <- as.numeric(dodo$Sub_metering_1)
Sub_metering_2 <- as.numeric(dodo$Sub_metering_2)
Sub_metering_3 <- as.numeric(dodo$Sub_metering_3)

Reactive <- as.numeric(dodo$Global_reactive_power)

png("plot4.png",width=485,height=485)
par(mfrow=c(2,2))

plot(dateandtime,Active,type="l",ylab="Global Active Power",xlab="")

plot(dateandtime,voltage,type="l",ylab="voltage",xlab="datetime")

plot(dateandtime,Sub_metering_1,type="l",ylab="Energy submetering",xlab="",col="black")
lines(dateandtime,Sub_metering_2,type="l",col="red")
lines(dateandtime,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

plot(dateandtime,Reactive,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()