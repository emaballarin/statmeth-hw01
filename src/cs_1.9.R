x <- seq(from = 0, to = 20, by = 1)

lambda <- c(0.7, 1.2, 5, 15)

par(mfcol = c(2, 2))

# Place the legend programmatically ;)
legendloc <- function(iter)
{
    if (iter < 4) {return("topright")}
    else {return("topleft")}
}

for (i in 1:4)
{
    poisson_distribution <- dpois(x, lambda[i])
    normal_distribution <-
        dnorm(x, mean = lambda[i], sd = sqrt(lambda[i]))

    plot(
        x,
        poisson_distribution,
        type = "l",
        ylab = "F(x)",
        main = paste("lambda = ", lambda[i]),
        col = "blue"
    )

    lines(x, normal_distribution, type = "l", col = "red")

    legend(
        legendloc(i),
        legend = c("poisson", "normal"),
        col = c("blue", "red"),
        lty = c(1, 1)
    )
}
