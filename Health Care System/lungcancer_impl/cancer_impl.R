#install.packages("xlsx")
#to install libraries
library("e1071")
library("dplyr")
#to load the traiining data
train <- read.csv("lungcancer.csv", stringsAsFactors = TRUE)
#to load the test data
test <- read.csv("test.csv", stringsAsFactors = TRUE)  
trainset <- sample(1:nrow(lungcancer),499,replace=FALSE)
train <- lungcancer[trainset,]
testset <- sample(1:nrow(test),2,replace=FALSE)
test <- test[testset,]
#naive bayes classifier
NB=naiveBayes(Cancer ~.,data=train)
 attributes(NB)
 NB$levels
trainset <- sample(1:nrow(lungcancer),499,replace=FALSE)
 train <- lungcancer[trainset,]
 testset <- sample(1:nrow(test),2,replace=FALSE)
 test <- test[testset,]
 predictedNB=predict(NB,train,type=c("class"))
 predictedNB=predict(NB,test,type=c("class"))
 predictedNB=predict(NB,test,type=c("raw"))
 predictedNB
 write.csv(predictedNB,file='ex.csv')
 a<-read.csv(file.choose(),header=T, stringsAsFactors = FALSE)
 c<-c(test,a)
 drop <- c("X")
 write.csv(c, file = "final4.csv", row.names = FALSE)
 