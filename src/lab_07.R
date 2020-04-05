#
# Please, note that this file is copy-pasted in the report Rmd. Keep them in sync!
#

# PORTION 01 -->

par(mfrow = c(1, 3))
n <- 100


# t-Student df = 5
y <- rt(n, df = 5)
qqplot(
    qt(ppoints(n), df = 5),
    y,
    xlab = "True quantiles",
    ylab = "Sample quantiles",
    main = "Q-Q plot for t-student(5): n=100",
    ylim = c(-5, 5),
    xlim = c(-5, 5)
)

qqline(
    y,
    distribution = function(p)
        qt(p, df = 5),
    col = "red"
)


# t-Student df = 20
y2 <- rt(100, 20)
qqplot(
    qt(ppoints(n), 20),
    y2,
    xlab = "True quantiles",
    ylab = "Sample quantiles",
    main = "Q-Q plot for t-student(20): n=100",
    ylim = c(-5, 5),
    xlim = c(-5, 5)
)
qqline(
    y2,
    distribution = function(p)
        qt(p, df = 20),
    col = "red"
)


# t-Student df = 100
y3 <- rt(100, 100)
qqplot(
    qt(ppoints(n), 100),
    y3,
    xlab = "True quantiles",
    ylab = "Sample quantiles",
    main = "Q-Q plot for t-student(100): n=100",
    ylim = c(-5, 5),
    xlim = c(-5, 5)
)
qqline(
    y3,
    distribution = function(p)
        qt(p, df = 100),
    col = "red"
)

# <-- PORTION 01


# PORTION 02 -->

# Cauchy
y4 <- rcauchy(100, 0, 1)

qqplot(
    qcauchy(ppoints(n), 0, 1),
    y4,
    xlab = "True quantiles",
    ylab = "Sample quantiles",
    main = "Q-Q plot for Cauchy(0,1): n=100"
)

qqline(
    y4,
    distribution = function(p)
        qcauchy(p, 0, 1),
    col = "red"
)

# <-- PORTION 02
