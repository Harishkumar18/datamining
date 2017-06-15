library("party")
install.packages("party")
library("rpart")
fit<-rpart(Cancer~ Age+Years.smoked+Average.per.day+Family.history+COPD,method="class",data = lungcancer)
printcp(fit)
plotcp(fit) # visualize cross-validation results
summary(fit)
# plot tree
plot(fit, uniform=TRUE,
     main="Classification Tree for lungcancer")
text(fit, use.n=TRUE, all=TRUE, cex=.8)
text(fit, use.n=TRUE, all=TRUE, cex=.8)
post(fit, file = "C:\Users\Harish\Documents\R project\decisiontree",
     title = "Classification Tree for lungcancer")
#regression tree
fit1<-rpart(Cancer~Age+Years.smoked+Average.per.day+Family.history+COPD,method="anova",data = lungcancer)
printcp(fit1)
plotcp(fit1) # visualize cross-validation results
summary(fit1)
plot(fit1, uniform=TRUE,
     main="Regression Tree for lungcancer")
text(fit1, use.n=TRUE, all=TRUE, cex=.8)
library("party")
output.tree <- ctree(
  Cancer ~ Age + Years.smoked + Average.per.day + Family.history + COPD, 
  data = lungcancer)
plot(output.tree)
#diabetes
fit2<-rpart( Class.variable ~  Plasma.glucose.concentration + Diastolic.blood.pressure + Bodymassindex , method="anova",data = diabetes)
printcp(fit2)
plotcp(fit2) # visualize cross-validation results
summary(fit2)
# plot tree
plot(fit2, uniform=TRUE,
     main="Classification Tree for diabetes")
text(fit2, use.n=TRUE, all=TRUE, cex=.8)
library("party")
output.tree <- ctree(
  Class.variable ~  Plasma.glucose.concentration + Diastolic.blood.pressure + Bodymassindex, 
  data = diabetes)
plot(output.tree)
