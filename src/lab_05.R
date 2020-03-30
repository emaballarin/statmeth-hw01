# ---------------------------------------------------------------------------- #
#                                                                              #
# Statistical Methods for Data Science ~ Homework Block 1                      #
#                                                                              #
# |> EXERCISE: LAB 5 <|                                                        #
#                                                                              #
# (C) 2020-* Vegliach, Morichetti, Cicchini and Ballarin                       #
#                                                                              #
# Eventually-updated version: https://github.com/emaballarin/statmeth-hw01     #
#                                                                              #
# ---------------------------------------------------------------------------- #

n <- 100000
r <- 0.5
p <- 0.5

nb_mixture <- function(my_n, my_r, my_p)
{
    Z = rgamma(my_n, shape = my_r, scale = my_p/(1-my_p))
    X = rpois(my_n, lambda = Z)
    return(X)
}

plot(hist(nb_mixture(n, r, p), freq = FALSE, breaks=20, main=paste("Histogram for a NB(0.3, 0.6)"), xlab="n")$counts/n)
points(dnbinom((0:15), r,p), col='red')

