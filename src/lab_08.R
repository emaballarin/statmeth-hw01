clt_function <- function(n, dist) {
    x <- seq(1, n)

    sample <- switch(
        dist,
        "beta" = rbeta(x, 2, 5),
        "binomial" = rbinom(x, n, 0.5),
        "chisquared" = rchisq(x, 5),
        "gamma" = rgamma(x, 3),
        "negativebinomial" = rnbinom(x, 3, 0.5),
        "tstudent" = rt(x, 5)
    )

    # Plot the distribution of the mean of the observations
    hist(
        sample,
        freq = FALSE,
        main = "CLT",
        border = "red",
        nclass = 50
    )

    # Normal
    mu <- mean(sample)
    var <- var(sample)
    curve(dnorm(x, mu, sqrt(var)),
          add = TRUE,
          col = "black",
          lwd = 2)
}


# Plots
par(mfrow = c(2, 2))

clt_function(1000, "beta")
clt_function(1000, "binomial")
clt_function(1000, "chisquared")
clt_function(1000, "tstudent")
