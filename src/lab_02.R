# Hyperparameters
k <- 3
p <- 0.08
upbound <- 1000


# As Binomial pdf
plot(0:upbound,
     dnbinom(0:upbound, size = k, prob = p),
     xlab="Y=number of failures before k successes", ylab="f(x), exact",pch=21, bg=1)


# As sum of k Geometric rvs, via histogram estimation with count averaging
avg_factor <- 1500  # A good...
bin_fact <- 1       # ... compromise.
seq_stencil <- seq(from = 0, to = upbound, by = bin_fact)


mycounts <- vector(mode = "numeric", upbound/bin_fact)

# Averaging
for (cnt in 0:avg_factor)
{
    mycounts = mycounts +
        hist(
            # k*(upbound + 1) elements are generated directly via the vectorized `rgeom` function. Such elements are
            # reshaped into a matrix of suitable dimensions via remainder-computation. Such matrix is transposed
            # and then summed column-wise to produce the wanted results.
        colSums(t(matrix(rgeom(((0:(k*(upbound+1)-1))%%(upbound+1)), prob = p), nrow=(upbound+1), ncol=k))),
        breaks = seq_stencil,
        plot = FALSE)$density
}

# Normalization
myedpf = mycounts/avg_factor

plot(seq_stencil[0:(length(seq_stencil)-1)], myedpf, # The number of bins is one less the number of breaks!
     xlab="Y=number of failures before k successes", ylab="f(x), approx.",pch=21, bg=1)
