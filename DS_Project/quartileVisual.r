
steamLib <- read.csv(file="./steam.csv", row.names=1)
attach(steamLib)

steamLib <- steamLib$price
steamLib <- steamLib[steamLib != 0]
steamLib <- steamLib[steamLib >= quantile(steamLib, 0.1, names=FALSE)]
steamLib <- steamLib[steamLib <= quantile(steamLib, 0.9, names=FALSE)]

hist(steamLib, main = 'Price quartiles 10% to 90%')