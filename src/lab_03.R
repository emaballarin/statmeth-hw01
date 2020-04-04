# ---------------------------------------------------------------------------- #
#                                                                              #
# Statistical Methods for Data Science ~ Homework Block 1                      #
#                                                                              #
# |> EXERCISE: LAB 3 <|                                                        #
#                                                                              #
# (C) 2020-* Vegliach, Morichetti, Cicchini and Ballarin                       #
#            (a.k.a. "Group B")                                                #
#                                                                              #
# Eventually-updated version: https://github.com/emaballarin/statmeth-hw01     #
#                                                                              #
# ---------------------------------------------------------------------------- #

# Plot
x <- seq(1:25)
df <- 5
n <- 1000
y <- rchisq(n, df)

hist(y, breaks = 40, probability = TRUE)
curve(
    dgamma(x, rate = 1 / 2, shape = df / 2),
    col = "red",
    lwd = 2,
    add = TRUE
)

# Quantiles
qgamma(0.05, 3, 3)
qgamma(0.95, 3, 3)
