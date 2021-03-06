census = read.csv("census.csv")
str(census)
library(caTools)
set.seed(2000)
spl = sample.split(census$over50k, SplitRatio = 0.6)
Train = subset(census, spl == TRUE)
Test = subset(census, spl == FALSE)
model1 = glm(over50k ~ ., data = Train, family = "binomial")
summary(model1)
predictModel1 = predict(model1, newdata = Test, type = "response")
table(Test$over50k, predictModel1 >= 0.5)
(9051+1888)/nrow(Test)
table(Train$over50k)
table(Test$over50k)
(9713)/(9713+3078)
library(ROCR)
ROCRpred = prediction(predictModel1, Test$over50k)
as.numeric(performance(ROCRpred, "auc")@y.values)
library(rpart)
CARTmodel1 = rpart(over50k ~ ., data = Train, method = "class")
library(rpart.plot)
prp(CARTmodel1)
predictCART = predict(CARTmodel1, newdata = Test, type = "class")
table(Test$over50k, predictCART)
(9243+1596)/(9243+470+1482+1596)
predictTest = predict(CARTmodel1, newdata = Test)
predictTest = predictTest[,2]
ROCRpred2 = prediction(predictTest, Test$over50k)
as.numeric(performance(ROCRpred2, "auc")@y.values)
set.seed(1)
trainSmall = Train[sample(nrow(Train),2000),]
set.seed(1)
library(randomForest)
RFmodel1 = randomForest(over50k ~ ., data = trainSmall)
predictTest = predict(RFmodel1, newdata = Test)
table(Test$over50k, predictTest)
(8843+2049)/nrow(Test)
vu = varUsed(RFmodel1, count = TRUE)
vusorted = sort(vu, decreasing = FALSE, index.return = TRUE)
dotchart(vusorted$x, names(RFmodel1$forest$xlevels[vusorted$ix]))
install.packages()
varImpPlot(RFmodel1)
set.seed(2)
library(caret)
fitControl = trainControl(method = "cv", number = 10)
cartGrid = expand.grid(.cp = seq(0.002,0.1,0.002))
train(over50k ~ ., data = Train, method = "rpart", trControl = fitControl, tuneGrid = cartGrid)
model = rpart(over50k ~ .,data = Train, method = "class", cp = 0.002)
predictTest = predict(model, newdata = Test, type = "class")
table(Test$over50k, predictTest)
(9178+1838)/(9178+535+1240+1838)
prp(model)