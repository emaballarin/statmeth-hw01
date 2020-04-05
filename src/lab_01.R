# Function
binomial <- function(x, n, p)
{
    return(choose(n, x) * p ^ x * (1 - p) ^ (n - x))
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
