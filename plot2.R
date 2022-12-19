#Read data file
data<- "household_power_consumption.txt"
data5 <- read.table(data, sep=";",header = T, stringsAsFactors = F,dec="." )
#Selected dates
dodo <- data5[data5$Date %in% c("1/2/2007","2/2/2007"),]
#Plot + save
xo <- paste(dodo$Date,dodo$Time,sep=" ")
datetime <- strptime(xo,"%d/%m/%Y %H:%M:%S")
Active <- as.numeric(dodo$Global_active_power)
png("plot2.png")
plot(datetime,Active,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()