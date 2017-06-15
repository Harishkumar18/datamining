library(randomForest)
#finding diabetes or not

output.forest <- randomForest(as.factor(Class.variable) ~ Numberoftimespregnant + Bodymassindex +Diabetespedigreefunction, data = diabetes)

# View the forest results.
print(output.forest)

# Importance of each predictor.
print(importance(output.forest,type = 2))

plot(output.forest,ylim=c(0,0.7))
