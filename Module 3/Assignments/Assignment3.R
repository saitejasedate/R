statedata = read.csv("statedata.csv")

Question-1
 plot(statedata$x, statedata$y)

Question-2
tapply(statedata$HS.Grad, statedata$state.region, mean)

Question-3
boxplot(statedata$Murder ~ statedata$state.region)

Question-4
NortheastData = subset(statedata, state.region == "Northeast")
table(NortheastData$Murder, NortheastData$state.abb)

Question-7
plot(statedata$Income, statedata$Life.Exp)

Question-8
LinReg = lm(Life.Exp ~ Population + Murder + HS.Grad + Frost, data=statedata)
sort(predict(LinReg))
statedata$state.name[1]

Question-9
 which.min(statedata$Life.Exp)
statedata$state.name[40]

Question-10
 which.max(statedata$Life.Exp)
statedata$state.name[11]

Question-11
statedata$state.name[47]

Question-12
sort(abs(LinReg$residuals))
statedata$state.name[14]

Question-13
statedata$state.name[11]


