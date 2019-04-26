fluTrain = read.csv("FluTrain.csv")

Question-1
hist(fluTrain$ILI, breaks=100)

Question-2
plot(log(fluTrain$ILI), fluTrain$Queries)

Question-4
FluTrend1 = lm(log(ILI) ~ Queries, data = fluTrain)
summary(FluTrend1)

Question-5
 correlation = cor(fluTrain$Queries, log(fluTrain$ILI))
correlation^2

Question-6
Flutest = read.csv("FluTest.csv")
PredTest1 = exp(predict(FluTrend1, newdata=Flutest))
PredTest1[which(Flutest$Week == "2012-03-11 - 2012-03-17")]

Question-7
Flutest$ILI[11]
(2.293422 - 2.187378)/2.293422

Question-8
SSE = sum((PredTest1 - Flutest$ILI)^2)
RMSE = sqrt(SSE/nrow(Flutest))
RMSE

Question-9
install.packages("zoo")
 library(zoo)
ILILag2 = lag(zoo(fluTrain$ILI), -2, na.pad=TRUE)
fluTrain$ILILag2 = coredata(ILILag2)
summary(fluTrain)

Question-10
 plot(log(fluTrain$ILILag2), log(fluTrain$ILI))

Question-11
FluTrend2 = lm(log(ILI) ~ Queries + log(ILILag2), data = fluTrain)
summary(FluTrend2)

Question-12
summary(FluTrend2)

Question-14
 ILILag2 = lag(zoo(Flutest$ILI), -2, na.pad=TRUE)
 Flutest$ILILag2 = coredata(ILILag2)
 summary(Flutest)

Question-17
 Flutest$ILILag2[1] = fluTrain$ILI[416]
 FluTest$ILILag2[2] = fluTrain$ILI[417]
fluTrain$ILI[416]

Question-18
fluTrain$ILI[417]

Question-19
PredTest2 = exp(predict(FluTrend2, newdata=Flutest))
 SSE = sum((PredTest2 - Flutest$ILI)^2)
 RMSE = sqrt(SSE/nrow(Flutest))
 RMSE


















