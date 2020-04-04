library(datasets)
#help(iris)

dni3 <- dimnames(iris3) # save the dimnamens of the object
# iris3
# given that iris3 is a 3-dimensional array 50 x 4 x 3
# the function dimnamens returns the names of each one
# of the 3 dimensions of it.
# the output is a list where the first element is null
# becuse the rows of iris3 have no names
# the second and the third elements are arrays that
# contain the names of the second and third dimension
# of iris3

test <- aperm(iris3, c(1,3,2))

ii <- data.frame( # create a dataframe from a matrix
    matrix( # create a matrix form the transpose of
        # the iris3 array
        aperm(iris3, c(1,3,2)), # transpose the 3-d array iris
        # result: 50 x 3 x 4 array
        ncol = 4, # having 4 columns
        # set the names of the rows and columns of the matrix
        dimnames = list(NULL, # create a list, starting from a
                        # NULL object
                        sub(" L.",".Length",
                            #substitute "L."  with ".Length"
                            # in the output of the following line
                            sub(" W.",".Width", dni3[[2]])))),
    # substitute "W." with ".Width" in
    # the strings contained in the list
    # of the names of the second
    # dimension of iris3: ("Sepal L."
    #  "Sepal W." "Petal L." "Petal W.")
    # create a new column of the dataframe called Spieces
    Species = gl( # generate factors given:
        3, 50, # the number of levels (=3), the number of
        # replications (=50)
        labels =  # and the labels of the levels
            sub("S", "s", sub("V", "v", dni3[[3]]))))
# substitute "S" with "s" and "V" with "v" in in the
# strings contained in the list of the names of the
# third dimension of iris3
# ("Setosa" "Versicolor" "Virginica")

all.equal(ii, iris) # compare the created object and iris
