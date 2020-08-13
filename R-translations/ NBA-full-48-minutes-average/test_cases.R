library(testthat)
library(dplyr)

testing <- function(inp1, inp2, expect) {
    s <- sprintf("%s", toString(c(inp1, inp2)))
    cat(s, "\n")
    actual <- nba_extrap(inp1, inp2)
    cat("actual:\n ", actual, "\n")
    cat("expect:\n ", expect, "\n")
    testthat::expect_equal(actual, expect)
}

testthat::test_that("Sample test cases", {
    testing(12, 20, 28.8)
    testing(10, 10, 48.0)
    testing(5, 17, 14.1)
    testing(0, 0, 0)
    testing(30.8, 34.7, 42.6)  # Russell Westbrook 1/15/17
    testing(22.9, 33.8, 32.5)  # Kemba Walker 1/15/17
})

testthat::test_that("Extended fixed tests", {
    testing(2, 5, 19.2)
    testing(3, 9, 16.0)
    testing(16, 27, 28.4)
    testing(11, 19, 27.8)
    testing(14, 33, 20.4)
    testing(1, 7.5, 6.4)
    testing(6, 13, 22.2)
})

testthat::test_that("Notable player fixed tests", {
    testing(23.8, 34.8, 32.8)  # C.J. McCollum 1/15/17
    testing(29.3, 37.1, 37.9)  # Anthony Davis 1/15/17
    testing(20.1, 29.4, 32.8)  # Brook Lopez 1/15/17
    testing(19.6, 25.2, 37.3)  # Joel Embiid 1/15/17
    testing(25.8, 37.1, 33.4)  # LeBron James 1/15/17
    testing(26.3, 35.8, 35.3)  # Damian Lillard 1/15/17
    testing(5.6, 18.6, 14.5)  # Zaza Pachulia 1/15/17
}) 

# function to generate random tests
y_tests <- function() {
    i <- 0
    while (i < 200) {
        i1 <- runif(1, 0, 1) * 35 %>% round(1)
        i2 <- runif(1, 1, 48) %>% round(1)
        sol <- nba_extrap(i1, i2)
        testing(i1, i2, sol)
        i <- i +1
    }
}
 
testthat::test_that("Random tests", {
    y_tests()
})