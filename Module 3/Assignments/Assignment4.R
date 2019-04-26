 elantra = read.csv("elantra.csv")

Question1
ElantraTest = subset(elantra, Year > 2012)
ElantraTrain = subset(elantra, Year <= 2012)
str(ElantraTrain)

Question-2
 model = lm(ElantraSales ~ Unemployment + Queries + CPI_energy + CPI_all, data=ElantraTrain)
 summary(model)

Question-3

 ElantrLM = lm(ElantraSales ~ Unemployment + Queries + CPI_energy + CPI_all + Month, data=ElantraTrain)
 summary(ElantrLM)

Question-4
 ElantraTrain$MonthFactor = as.factor(ElantraTrain$Month)
 
 ElantraTest$MonthFactor = as.factor(ElantraTest$Month)
 ElantrLM = lm(ElantraSales ~ Unemployment + Queries + CPI_energy + CPI_all + MonthFactor, data=ElantraTrain)
 summary(ElantrLM)

Question-5
PredictTest = predict(ElantrLM, newdata=ElantraTest)
SSE = sum((PredictTest - ElantraTest$ElantraSales)^2)
SSE

Question-6
SST = sum((mean(ElantraTrain$ElantraSales) - ElantraTest$ElantraSales)^2)
SST

Question-7
SST = sum((mean(ElantraTrain$ElantraSales) - ElantraTest$ElantraSales)^2)
SSE = sum((PredictTest - ElantraTest$ElantraSales)^2)
testset = 1-SST/SSE

Question-8
max(abs(PredictTest - ElantraTest$ElantraSales))

Question-9
which.max(abs(PredictTest - ElantraTest$ElantraSales))




