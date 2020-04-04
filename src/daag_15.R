# ---------------------------------------------------------------------------- #
#                                                                              #
# Statistical Methods for Data Science ~ Homework Block 1                      #
#                                                                              #
# |> EXERCISE: DAAG 15 <|                                                      #
#                                                                              #
# (C) 2020-* Vegliach, Morichetti, Cicchini and Ballarin                       #
#            (a.k.a. "Group B")                                                #
#                                                                              #
# Eventually-updated version: https://github.com/emaballarin/statmeth-hw01     #
#                                                                              #
# ---------------------------------------------------------------------------- #

library(DAAG)
data(socsupport)

par(mfrow=c(1,2))

n=10
plot(BDI ~ age, data=socsupport, main = paste("The value of n is:", n))
plot(BDI ~ unclass(age), data=socsupport)

summary(socsupport$age)
