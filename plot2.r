setwd('/Users/xichen/Documents/Coursera')
df <- data.frame(read.table('./power.txt', comment.char = '#', header=TRUE, sep=';',
                            na.strings = '?')) ##read file into a dataframe
df1 <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]
datetime <- strptime(paste(df1$Date, df1$Time, sep=' '), '%d/%m/%Y %H:%M:%S')
globalactivepower <- as.numeric(df1$Global_active_power)
png('plot2.png', width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab='', ylab='Global Active Power(kilowatts)')


