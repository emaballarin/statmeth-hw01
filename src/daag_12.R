library(DAAG)
library(Devore7)


# Part "(a)"

cutoff_prop <- function(x, cutoff)
{
    return(sum(x > cutoff) / length(x))
}

my_linspace <- c(1:100)
my_cutoff <- 35

cutoff_prop(my_linspace, my_cutoff)


# Part "(b)"

devore_times <- Devore7::ex01.36

dotplot(devore_times)

seven_min_in_sec <- 7*60

toolate_prop <- cutoff_prop(devore_times$C1, seven_min_in_sec)
toolate_prop
