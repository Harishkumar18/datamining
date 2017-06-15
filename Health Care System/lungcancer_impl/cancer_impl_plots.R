
library(randomForest)
library(dplyr)

output.forest <- randomForest(as.factor(Cancer) ~ Smoking.Status + Years.smoked + Average.per.day, 
                              data = lungfi)
lung<-lungfi%>%filter(Smoking.Status=="Smoker")
# View the forest results.
print(output.forest)

# Importance of each predictor.
print(importance(output.forest,type = 2))

plot(output.forest,ylim=c(0,0.7))

plot(lungfi$Smoking.Status,lungfi$Gender)
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
install.packages("corrplot")
library(corrplot)
ggplot(lungfi,aes(x=Smoking.Status,y=Cancer))+geom_point()
lung<-lungfi%>%filter(Smoking.Status=="Smoker")
lung2<-lungfi%>%filter(Smoking.Status=="Non Smoker")
lung3<-lungfi%>%filter(Smoking.Status=="Former Smoker")
ggplotly(qplot(x =  Gender, y =Family.history , data = lungfi, 
               color =Smoking.Status) +
           ggtitle("Gender Wise Smoking Status"))
ggplot(data = lungfi) + 
  geom_point(mapping = aes(x = Smoking.Status, y = Gender))
ggplot(data = lungfi) + 
  geom_point(mapping = aes(x = Smoking.Status, y = Race))
ggplot(data = lungfi) + 
  geom_point(mapping = aes(x = Smoking.Status, y = Years.smoked,color=Cancer))
ggplot(data = lungfi) + 
  geom_point(mapping = aes(x = Smoking.Status, y = Years.smoked,size=Average.per.day))
ggplot(data = lungfi) + 
  geom_point(mapping = aes(x = Year, y = Smoking.Status))

ggplot(data = lungfi) + 
  geom_point(mapping = aes(x = Race, y = Smoking.Status,color=Grade))
p <- ggplot(lungfi, aes(Smoking.Status, Years.smoked, color=Grade)) 
p
install.packages("rgl")
library(rgl)
plot3d(lungfi$Smoking.Status, lungfi$Years.smoked, lungfi$Cancer)
