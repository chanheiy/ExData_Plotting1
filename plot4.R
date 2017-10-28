setwd('/Users/xichen/Documents/Coursera')
df <- data.frame(read.table('./power.txt', comment.char = '#', header=TRUE, sep=';',
                            na.strings = '?')) ##read file into a dataframe
df1 <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]
datetime <- strptime(paste(df1$Date, df1$Time, sep=' '), '%d/%m/%Y %H:%M:%S')
y <- df1$Sub_metering_1
z <- df1$Sub_metering_2
g <- df1$Sub_metering_3
GAP <- as.numeric(df1$Global_active_power)
GRP <- as.numeric(df1$Global_reactive_power)
V <- as.numeric(df1$Voltage)
png('plot4.png', width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, V, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, y, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, z, type="l", col="red")
lines(datetime, g, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()