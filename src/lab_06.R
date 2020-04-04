# Function to compute eCDF
my_ecdf <- function(x)
{
    z <- c()
    y <- sort(x)

    for (i in 1:length(y))
    {
        z[i] <- i / length(y)
    }

    z <- cbind(z, y)
    return(z)
}

# Function to plot eCDF
plot_ecdf <- function(x)
{
    plot(
        x[, 2],
        x[, 1],
        type = "s",
        ylim = c(-0.01, 1.01),
        xlab = "x",
        ylab = "Fn(x)",
        main = "ECDF and CDF: n=50"
    )

    abline(0, 0, col = "gray", lty = 2)
    abline(1, 0, col = "gray", lty = 2)
}

set.seed(2)
par(mfrow = c(1, 2))


# n = 50
n <- 50

y <- rbeta(n, 3, 4)
tt <- seq(from = 0, to = 1, by = 0.01)

my_edf_beta <- my_ecdf(y)

plot_ecdf(my_edf_beta)

lines(tt,
      pbeta(tt, 3, 4),
      col = 2,
      lty = 2,
      lwd = 2)


# n = 500
n2 <- 500

y2 <- rbeta(n2, 3, 4)

my_edf_beta2 <- my_ecdf(y2)

plot_ecdf(my_edf_beta2)

lines(tt,
      pbeta(tt, 3, 4),
      col = 2,
      lty = 2,
      lwd = 2)
