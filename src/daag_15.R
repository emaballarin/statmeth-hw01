#
# Please, note that this file is copy-pasted in the report Rmd. Keep them in sync!
#

# PORTION 01 -->

library(DAAG)
library(lattice)
data(socsupport)

par(mfrow=c(1,2))

plot(BDI ~ age, data=socsupport)
plot(BDI ~ unclass(age), data=socsupport)

# <-- PORTION 01


# PORTION 02 -->

summary(socsupport$age)

# <-- PORTION 02
