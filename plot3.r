setwd('/Users/xichen/Documents/Coursera')
df <- data.frame(read.table('./power.txt', comment.char = '#', header=TRUE, sep=';',
                            na.strings = '?')) ##read file into a dataframe
df1 <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]
datetime <- strptime(paste(df1$Date, df1$Time, sep=' '), '%d/%m/%Y %H:%M:%S')
y <- df1$Sub_metering_1
z <- df1$Sub_metering_2
g <- df1$Sub_metering_3
png('plot3.png', width=480, height=480)
plot(datetime, y, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, z, type="l", col="red")
lines(datetime, g, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()