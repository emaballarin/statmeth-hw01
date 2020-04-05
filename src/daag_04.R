library(DAAG)
library(data.table) # setDT

data <- ais
str(data)

# function is.na return, for each element of the data frame, if
# it's NaN then it returns TRUE, otherwise FALSE.
# function sum counts the number of elements that are TRUE (So,
# in our case it counts how elements are NaN).
cat("Number of elements that are NaN = ", sum(is.na(data)))


# create a table that sumamrize numbers of males and females for each
# sport and define a new column, called "ratio", showing the ratio
# between sexes.

# summarizing table
sex_frequency <- table(data$sport, data$sex)

# ratio vector: f / m
ratio <- sex_frequency[1:nrow(sex_frequency)] / sex_frequency[1:nrow(sex_frequency), 2]

# final table with ratio column
sex_frequency <- cbind(sex_frequency, ratio)

# convert table into dataframe
sex_frequency <- as.data.frame(sex_frequency)

# convert rows name in first column of the data frame
# and print dataframe
setDT(sex_frequency, keep.rownames = "sport")[]

cat("Unbalanced Sport (ratio > 2):", sex_frequency$sport[sex_frequency$ratio > 2])
