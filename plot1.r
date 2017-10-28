setwd('/Users/xichen/Documents/Coursera')
df <- data.frame(read.table('./power.txt', comment.char = '#', header=TRUE, sep=';',
                            na.strings = '?')) ##read file into a dataframe
head(df) ## look at the first few rows of df
mean(is.na(df))
good <- complete.cases(df)
df <- df[good,]
df1 <- df[,c(1,2,3,5,7,8,9)] # subset df by target columns 
head(df1) ## look at the first few rows of df1 
df1$newdate <- strptime(as.character(df1$Date), '%d/%m/%Y') ## change the format of dates in df1
head(df1) ## look at the first few rows of df1 
df2 <- df1[,c(2,3,4,5,6,7,8)] ## subset df1 by deleting Date 
df3 <- df2[df2$newdate %in% c('2007-02-01', '2007-02-02')] ## subset df2 by values of newdate
head(df3) ## look at the first few rows of df3()
x <- as.numeric(df3$Global_active_power)/500
##plot a histogram 
hist(x, main='Global Active Power', xlab='Global Active Power(kilowatts)', ylab='Frequency',col='red', xlim=c(0,6), ylim=c(0, 1200), xaxt='n')
axis(1, at=seq(0,6,2), labels=seq(0,6,2))

