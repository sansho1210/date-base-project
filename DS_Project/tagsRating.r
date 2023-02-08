
library(plyr)


steamLib <- read.csv(file="./steam.csv", row.names=1)

#summary(steamLib)
steamDF <- data.frame(steamLib)


steamDF$categ <- sapply(strsplit(steamDF$steamspy_tags, ';'), head, 1)


#goodGenres <- unique(steamDF$genres[count(steamDF, "genres")[2] > 70])
goodRows <- unique(steamDF$categ[steamDF$positive_ratings + steamDF$negative_ratings > 35000])
relevantGames <- steamDF[steamDF$categ %in% goodRows,]
relevantGames

ratingPercent <-(relevantGames$positive_ratings / (relevantGames$positive_ratings + relevantGames$negative_ratings))
ratingPerCateg <- aggregate(ratingPercent, list(relevantGames$categ), mean)

length(unique(goodRows))
length(ratingPerCateg$x)



par(mar=c(10,5,1,2))
ratingPerCateg <- ratingPerCateg[order(ratingPerCateg$x),]
ratingPerCateg
barplot(ratingPerCateg$x, names.arg=ratingPerCateg$Group.1, las=2)
