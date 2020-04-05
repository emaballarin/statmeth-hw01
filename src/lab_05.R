n <- 200000
r <- 0.5
p <- 0.5

nb_mixture <- function(my_n, my_r, my_p)
{
    # Note: here we use the shape/scale parametrization!
    Z = rgamma(my_n, shape = my_r, scale = my_p/(1-my_p))
    X = rpois(my_n, lambda = Z)
    return(X)
}

plot(hist(nb_mixture(n, r, p), breaks=15, plot = FALSE)$counts/n, xlab = "x", ylab = "NegBin(x)")
points(dnbinom((0:15), r,p), col='red')
