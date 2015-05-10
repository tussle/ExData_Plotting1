df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
assdf <- df[df[,1]!="?" & as.Date(df[,1],"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(df[,1],"%d/%m/%Y")<=as.Date("02/02/2007","%d/%m/%Y"),]
hist(as.numeric(assdf[assdf[,3]!="?",3]),col="red",main="Global Active Power", xlab="Global Active Power (klowatts)")
dev.copy(png,"plot1.png")
dev.off()