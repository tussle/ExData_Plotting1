df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
assdf <- df[df[,1]!="?" & as.Date(df[,1],"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(df[,1],"%d/%m/%Y")<=as.Date("02/02/2007","%d/%m/%Y"),]
dt <- strptime(paste(assdf[assdf[,7]!="?" & assdf[,8]!="?" & assdf[,9]!="?",1],assdf[assdf[,7]!="?",2],sep=" "),"%d/%m/%Y %X")
plot(dt,as.numeric(assdf[assdf[,7]!="?",7]),type="l",xlab="",ylab="Energy Sub Metreing", main="GlobalActive Power")
lines(dt, as.numeric(assdf[assdf[,8]!="?",8]), type = "l", col = "red")
lines(dt, as.numeric(assdf[assdf[,9]!="?",9]), type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0)
dev.copy(png,"plot3.png")
dev.off()