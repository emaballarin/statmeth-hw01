######## LAB 1 ###########

######### EX 1 #######

# function
binomial <- function(x, n, p){
  prob <- choose(n, x) * p^x * (1-p)^(n-x)
  return(prob)
}

# test the function
binomial(3,6,0.5)
dbinom(3,6,0.5)

binomial(5,100,0.1)
dbinom(5,100,0.1)

binomial(5,10,0.5)
dbinom(5,10,0.5)

binomial(1,2,0.5)
dbinom(1,2,0.5)

# plot
x<- seq(1:20)
y1<-binomial(x,20,0.3)
y2 <- binomial(x,20,0.6)
plot(x,y1)
points(x,y2, col="red")

######## EX 3 ##########

#plot
x<- seq(1:25)
df<-5
n<-1000
y<-rchisq(n, df)
hist(y, breaks=40, probability=TRUE)
curve(dgamma(x, rate=1/2, shape=df/2), col="red", lwd=2, add=TRUE)

#quantile
qgamma(0.05, 3,3)
qgamma(0.95,3,3)

######## EX 4 ######
n= 1000
x <- rbeta(n,5,2)
mean(x)
var(x)

####### EX 6 ######
#function to calculate ecfd
my_ecdf <- function(x){
  z <- c()
  y <- sort(x)
  for (i in 1:length(y)){
    z[i]<-i/length(y)
  }
  z <- cbind(z, y)
  return(z)
}

#function to plot ecfd
plot_ecdf <- function(x){
  plot(x[,2], x[,1], type="s", ylim=c(-0.01, 1.01), xlab="x", ylab = "Fn(x)", main="ECDF and CDF: n=50")
  abline(0, 0, col="gray", lty=2)
  abline(1, 0, col="gray", lty=2)
}

# n=50
set.seed(2)
par(mfrow=c(1,2))
n<-50
y<-rbeta(n, 3,4)
tt<-seq(from=0, to=1, by=0.01)
my_edf_beta <-my_ecdf(y)
plot_ecdf(my_edf_beta)
lines(tt, pbeta(tt,3,4), col=2, lty=2, lwd=2)

#n=500
n2<-500
y2<-rbeta(n2, 3,4)
my_edf_beta2<-my_ecdf(y2)
plot_ecdf(my_edf_beta2)
lines(tt, pbeta(tt,3,4), col=2, lty=2, lwd=2)

##### EX 7 ####

par(mfrow=c(1,3))
n <- 100
y <- rt(n, df=5)
qqplot(qt(ppoints(n), df=5), y,
       xlab="True quantiles", ylab="Sample quantiles",
       main = "Q-Q plot for t-student(5): n=100")
qqline(y, distribution = function(p) qt(p, df = 5), col="red")

y2 <- rt(100, 20)
qqplot(qt(ppoints(n),20),y2,
       xlab="True quantiles", ylab="Sample quantiles",
       main = "Q-Q plot for t-student(20): n=100")
qqline(y2, distribution = function(p) qt(p, df = 20), col="red")

y3 <- rt(100, 100)
qqplot(qt(ppoints(n),100),y3,
       xlab="True quantiles", ylab="Sample quantiles",
       main = "Q-Q plot for t-student(100): n=100")
qqline(y3, distribution = function(p) qt(p, df = 100), col="red")

y4 <- rcauchy(x, 0, 1)
qqplot(qcauchy(ppoints(n),0, 1),y4,
       xlab="True quantiles", ylab="Sample quantiles",
       main = "Q-Q plot for Cauchy(0,1): n=100")
qqline(y4, distribution = function(p) qcauchy(p, 0, 1), col="red")


#### EX 8 ########

clt_function <- function(n, dist){

    x<-seq(1, n)

    sample <- switch(dist,
                     "beta" = rbeta(x, 2, 5),
                     "binomial" = rbinom(x, n, 0.5),
                     "chisquared" = rchisq(x, 5),
                     "gamma" = rgamma(x, 3),
                     "negativebinomial" = rnbinom(x, 3, 0.5),
                     "tstudent" = rt(x, 5))

    # plot the distribution of the mean of the observations
    hist(sample, freq=FALSE, main="CLT", border="red", nclass=50)
    # plot(density(sample), col="red", lwd = 1, main ="CLT")

    # normal
    mu = mean(sample)
    var = var(sample)
    curve(dnorm(x, mu, sqrt(var)), add= TRUE, col="black", lwd=2)
}

par(mfrow=c(2,2))
clt_function(1000, "beta")
clt_function(1000, "binomial")
clt_function(1000, "chisquared")
clt_function(1000, "tstudent")
