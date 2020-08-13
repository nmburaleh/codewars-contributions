library(testthat)

testing <- function(input, expect) {
  s <- sprintf("%s", toString(input))
  cat(s, "\n")
  actual <- square_or_square_root(input)
  cat("actual:\n ", actual, "\n")
  cat("expect:\n ", expect, "\n")
  expect_equal(actual, expect)
}

testthat::test_that("Fixed tests", {
  testing(c(4, 3, 9, 7, 2, 1 ), c(2, 9, 3, 49, 4, 1))
  testing(c(100, 101, 5, 5, 1, 1), c(10, 10201, 25, 25, 1, 1))
  testing(c(1, 2, 3, 4, 5, 6), c(1, 4, 9, 2, 25, 36))
  
})

# random tests
y_tests <- function() {
    i <- 0
    while (i < 200) {
        rand_vector <- base::sample.int(5000, 6)
        sol <- square_or_square_root(rand_vector)
        testing(rand_vector, sol)
        i <- i + 1
    }
}

testthat::test_that("Random tests", {
    y_tests()
})