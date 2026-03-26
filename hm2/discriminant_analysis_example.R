
# load the wine data
library(car)
install.packages('rattle')
library(rattle)
data(wine, package='rattle')
attach(wine)
head(wine)

# install the MASS packages which has a built in lda function
install.packages('MASS')
library(MASS)

# run linear discriminant analysis on the wine data. The number of linear discriminants produced is <= min(3-1,13) = 2, since
# there are 3 groups and each measurement is in 13-dimensional space. We will see it's actually equal = 2 in this case
wine.lda <- lda(Type ~ ., data=wine)
wine.lda

# compute the discriminant values for all data points
wine.lda.values <- predict(wine.lda)
# the next command computes the FIRST discriminant score for all data points, grouped by the type of wine
ldahist(data = wine.lda.values$x[,1], g=Type)
# the next command computes the SECOND discriminant score for all data points, grouped by the type of wine
ldahist(data = wine.lda.values$x[,2], g=Type)
# note that in the first "stacked histogram" the three types seem well separated
# in the second "stacked histogram" the first and third type are grouped together, the second is well separated

# make a scatterplot of the first two discriminants and see if we can observe the three distinct groups
plot(wine.lda.values$x[,1],wine.lda.values$x[,2]) # make a scatterplot
text(wine.lda.values$x[,1],wine.lda.values$x[,2],Type,cex=0.7,pos=4,col="red") # add labels
library(Ecdat)
data <- data(CaliforniaHousing)
