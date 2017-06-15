install.packages("xlsx")
library("e1071")
library("dplyr")
training<-read.csv(file.choose(),header=T, stringsAsFactors = FALSE)   
testing<-read.csv(file.choose(),header=T, stringsAsFactors = FALSE)  
trainset <- sample(1:nrow(training),499,replace=FALSE)
train <- training[trainset,]
testset <- sample(1:nrow(testing),9,replace=FALSE)
test <- testing[testset,]
NB=naiveBayes(Cancer ~.,data=train)
attributes(NB)
NB$apriori
NB$levels
predictedNB=predict(NB,train,type=c("raw"))
predictedNB=predict(NB,train,type=c("class"))
predictedNB=predict(NB,test,type=c("raw"))
predictedNB=predict(NB,test,type=c("class"))
predictedNB
write.csv(predictedNB,file='predvalue1.csv')
a<-read.csv(file.choose(),header=T, stringsAsFactors = FALSE)
c<-c(test,a)
c$X<-NULL
c[[13]]<-NULL
write.csv(c, file = "finaloutput.csv", row.names = FALSE)
