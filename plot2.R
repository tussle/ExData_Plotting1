df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
assdf <- df[df[,1]!="?" & as.Date(df[,1],"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(df[,1],"%d/%m/%Y")<=as.Date("02/02/2007","%d/%m/%Y"),]
plot(strptime(paste(assdf[assdf[,3]!="?",1],assdf[assdf[,3]!="?",2],sep=" "),"%d/%m/%Y %X"),as.numeric(assdf[assdf[,3]!="?",3]),type="l",xlab="",ylab="Global Active Power (kilowatts)", main="GlobalActive Power")
dev.copy(png,"plot2.png")
dev.off()