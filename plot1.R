#Read data file
data<- "household_power_consumption.txt"
data5 <- read.table(data, sep=";",header = T, stringsAsFactors = F,dec="." )
#Selected dates
dodo <- data5[data5$Date %in% c("1/2/2007","2/2/2007"),]
#Plot + save
Active <- as.numeric(dodo$Global_active_power)
png("plot1.R.png")
hist(Active,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()