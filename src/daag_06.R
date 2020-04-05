library(DAAG)


# Part: "preliminary"

Manitoba.lakes <- data.frame(
    row.names = c(
        "Winnipeg",
        "Winnipegosis",
        "Manitoba",
        "SouthernIndian",
        "Cedar",
        "Island",
        "Gods",
        "Cross",
        "Playgreen"
    ),

    elevation = c(217., 254., 248., 254., 253., 227., 178., 207., 217),
    area = c(24387., 5374., 4624., 2247., 1353., 1223., 1151., 755., 657.)
)


# Part: "(a)"

attach(Manitoba.lakes)

plot(log2(area) ~ elevation,
     pch = 16,
     xlim = c(170, 280))

# NB: Doubling the area increases log2(area) by 1.0
text(log2(area) ~ elevation,
     labels = row.names(Manitoba.lakes),
     pos = 4)

text(log2(area) ~ elevation, labels = Manitoba.lakes$area, pos = 2)

title("Manitoba’s Largest Lakes")

detach(Manitoba.lakes)


# Part: "(b)"

attach(Manitoba.lakes)
plot(
    area ~ elevation,
    pch = 16,
    xlim = c(170, 280),
    log = "y"
)

text(area ~ elevation,
     labels = row.names(Manitoba.lakes),
     pos = 4)

text(area ~ elevation, labels = Manitoba.lakes$area, pos = 2)

title("Manitoba’s Largest Lakes")

detach(Manitoba.lakes)
