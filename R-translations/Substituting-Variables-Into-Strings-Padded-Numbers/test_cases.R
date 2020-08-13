library(testthat)

testthat::test_that("Basic Tests", {
    testthat::expect_equal(solution(0), 'Value is 00000')
    testthat::expect_equal(solution(5), 'Value is 00005')
    testthat::expect_equal(solution(109), 'Value is 00109')
    testthat::expect_equal(solution(1204), 'Value is 01204')
})


testthat::test_that("Random Tests", {
    sol <- function(value) {
        value_padded <- stringr::str_pad(value, 5, 'left', '0')
        return (stringr::str_interp("Value is ${value_padded}"))
    }
    for (t in 1:100) {
        x <- floor(runif(1, min = 1, max = 100000))
        testthat::expect_equal(solution(x), sol(x))
    }
})