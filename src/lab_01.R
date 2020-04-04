# ---------------------------------------------------------------------------- #
#                                                                              #
# Statistical Methods for Data Science ~ Homework Block 1                      #
#                                                                              #
# |> EXERCISE: LAB 1 <|                                                        #
#                                                                              #
# (C) 2020-* Vegliach, Morichetti, Cicchini and Ballarin                       #
#            (a.k.a. "Group B")                                                #
#                                                                              #
# Eventually-updated version: https://github.com/emaballarin/statmeth-hw01     #
#                                                                              #
# ---------------------------------------------------------------------------- #

# Function
binomial <- function(x, n, p)
{
    prob <- choose(n, x) * p ^ x * (1 - p) ^ (n - x)
    return(prob)
}

# Test the function
binomial(3, 6, 0.5)
dbinom(3, 6, 0.5)

binomial(5, 100, 0.1)
dbinom(5, 100, 0.1)

binomial(5, 10, 0.5)
dbinom(5, 10, 0.5)

binomial(1, 2, 0.5)
dbinom(1, 2, 0.5)

# Plot
x <- seq(1:20)
y1 <- binomial(x, 20, 0.3)
y2 <- binomial(x, 20, 0.6)
plot(x, y1)
points(x, y2, col = "red")
