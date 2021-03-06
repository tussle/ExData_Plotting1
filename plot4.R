df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
assdf <- df[df[,1]!="?" & as.Date(df[,1],"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(df[,1],"%d/%m/%Y")<=as.Date("02/02/2007","%d/%m/%Y"),]
dt <- strptime(paste(assdf[assdf[,3]!="?" & assdf[,4]!="?" & assdf[,5]!="?" & assdf[,7]!="?" & assdf[,8]!="?" & assdf[,9]!="?",1],assdf[assdf[,7]!="?",2],sep=" "),"%d/%m/%Y %X")
par(mfrow=c(2,2))
plot(dt, assdf[assdf[,3]!="?",3], type = "l", xlab = "", ylab = "Global Active Power")
plot(dt, assdf[assdf[,5]!="?",5], type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt,as.numeric(assdf[assdf[,7]!="?",7]),type="l",xlab="",ylab="Energy Sub Metreing", main="GlobalActive Power")
lines(dt, as.numeric(assdf[assdf[,8]!="?",8]), type = "l", col = "red")
lines(dt, as.numeric(assdf[assdf[,9]!="?",9]), type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.5)
plot(dt, assdf[assdf[,4]!="?",4], ylim = c(0.0, 0.5),  type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png,"plot4.png")
dev.off()
