pisaTest = read.csv("pisa2009test.csv")
pisaTrain = read.csv("pisa2009train.csv")

Question-1
nrow(pisaTrain)

Question-2
tapply(pisaTrain$readingScore, pisaTrain$male, mean)

Question-3
 summary(pisaTrain)

Question-4
pisaTrain = na.omit(pisaTrain)
pisaTest = na.omit(pisaTest)
str(pisaTrain)

Question-5,6
table(pisaTrain$grade)
table(pisaTrain$male)
table(pisaTrain$raceeth)

Question-10
lmScore = lm(readingScore ~ ., data = pisaTrain)
summary(lmScore)

Question-11
SSE = sum(lmScore$residuals^2)
RMSE = sqrt(SSE/nrow(pisaTrain))

Question-14
redTest = predict(lmScore, newdata = pisaTest)
summary(redTest)

Question -15
SSE = sum((redTest - pisaTest$readingScore)^2)

Question-16
RMSE = sqrt(SSE/nrow(pisaTest))

Question-17
mean(pisaTrain$readingScore)

Question-18
SST = sum((mean(pisaTrain$readingScore)- pisaTest$readingScore)^2)
SST

Question-19
testsetRsquare = 1 - SSE/SST
testsetRsquare









