library("e1071")
lungsf2 <- read.csv("~/Documents/R project/lung cancer/lungsf2.csv")
View(lungsf2)
trainset <- sample(1:nrow(lungsf2),50,replace=FALSE)
train <- lungsf2[trainset,]
test <- lungsf2[-trainset,]
View(train)
NB=naiveBayes(Smoking.Status ~.,data=train)
attributes(NB)
NB$apriori
NB$levels
predictedNB=predict(NB,test,type=c("class"))
table(predictedNB,test$Smoking.Status)
predict(NB, lungsf2, type=c("class"))
predict(NB, lungsf2, type=c("raw"))


#visualiztion
library(dplyr)
library(ggplot2)
install.packages("plotly")
library(plotly)
library(grid)
install.packages("gridExtra")
library(gridExtra)
install.packages("DT")
library(DT)
install.packages("GGally")
library(GGally)
install.packages("randomForest")
library(randomForest)
install.packages("corrplot")
library(corrplot)
ggplot(lungsf2,aes(x=Year,y=Smoking.Status))+geom_point()
plot(lungsf2$Smoking.Status,lungsf2$Gender)

#visualization


#filter the attribute
lung<-lungsf2%>%filter(Smoking.Status=="Smoker")
lung2<-lungsf2%>%filter(Smoking.Status=="Non Smoker")
lung3<-lungsf2%>%filter(Smoking.Status=="Former Smoker")
#load data
health<-read.csv(file.choose(),header = T,stringsAsFactors = FALSE)
ggplotly(qplot(x =  Year, y =Gender , data = lungsf2, 
               color =Smoking.Status) +
           ggtitle("Gender Wise Smoking Status"))

ggplotly(qplot(x =  Gender, y =Family.history , data = health, 
               color =Smoking.Status) +
           ggtitle("Gender Wise Smoking Status"))


g1 <- qplot(x = Gender, y = Race, data = lung, ylab = "Race") +
  geom_smooth(method='lm',formula=y~x)

g2 <- qplot(x = Gender, y = Race, data = lung2, ylab = "Race") +
  geom_smooth(method='lm',formula=y~x)

g3 <- qplot(x = Gender, y = Race, data = lung3, ylab = "Race") +
  geom_smooth(method='lm',formula=y~x)

grid.arrange(g1, g2, g3,nrow =2, ncol = 2)


g2 <- qplot(x = Years.smoked, y = Race, data = lung2, ylab = "Race") +
  geom_smooth(method='lm',formula=y~x)

