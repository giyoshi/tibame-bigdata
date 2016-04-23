x=seq(1:6); y=x
#par is parameter
par(mfrow=c(2,4))
#幾種不同的圖形
types = c("p", "l", "o", "b", "c", "s", "h", "n")
for(i in 1:length(types)){
  title = paste("type:" ,types[i])
  plot(x, y, type="n", main = title)
  lines(x, y, type = types[i])
}

taipei<- c(92.5,132.6,168.8,159.1,218.7)
tainan <- c(21.2, 30.6, 37.3, 84.6, 184.3)
#ylim set the upper and lower bound of the y-axis in the graph
plot(taipei, type="h", col="blue", ylim=c(0,220), xlab="Month", ylab="Rainfall")
#pch set the graph type on nodes and there are others check p.26 of Lab 3 pdf
#lty check the style of the line also refer to p.26 of lab 3
lines(tainan , type="b", pch=22, lty=2, col="red")

#bar part  barplot(main="") main is title on top of the chart
housePrice = read.csv('house-prices.csv', header = TRUE)
bedrooms = housePrice$Bedrooms 
bedroomsTable = table(bedrooms) 
barplot(bedroomsTable, main="Bedroom Type Calculate", xlab="bedroom type", ylab="count" )

#histogram
load('cdc.Rdata')
View(cdc)
weight = cdc$weight 
hist(weight,breaks=50)

#histogram v.s. barchart
par(mfrow=c(2,1)) 
hist(weight,breaks=50,xlim=c(70,380)) 
barplot(table(cdc$weight),xlab="weight",ylab="Frequency")
par(mfrow=c(1,1))
