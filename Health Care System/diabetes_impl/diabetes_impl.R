#include library
library(e1071)
#viewing entire file
View(diabetes)
#divide entire data into trainning and test datas 
trainset <- sample(1:nrow(diabetes),400,replace=FALSE)
train <- diabetes[trainset,]
test <- diabetes[-trainset,]
#using naive byes classifier
NB=naiveBayes(Class.variable ~.,data=train)
attributes(NB)
View(trainset)
View(train)0
attributes(NB)
NB$apriori
NB$levels
#predict the classifier
predictedNB=predict(NB,test,type=C("class"))
predictedNB=predict(NB,test,type=c("class"))
predictedNB
table(predictedNB,test$class.variable)
predict(NB, diabetes, type=c("class"))
predict(NB, diabetes, type=c("raw"))
-