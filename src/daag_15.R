library(DAAG)
data(socsupport)

par(mfrow=c(1,2))

n=10
plot(BDI ~ age, data=socsupport, main = paste("The value of n is:", n))
plot(BDI ~ unclass(age), data=socsupport)

summary(socsupport$age)
