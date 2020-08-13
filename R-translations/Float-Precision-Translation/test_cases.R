# sample test cases
library(testthat)

testthat::test_that("samples tests", {
    testthat::expect_equal(solution(2.34), 2.34)
    testthat::expect_equal(solution(5.678), 5.68)
})

# fixed and random
translator_sol <- function(n) {
    return (base::round(n, digits = 2))
}

testthat::test_that("fixed test cases", {
    cases <- c(2.3445345, 1.1356, 11.4234, 2.34545, 445.234234)
    for (n in cases) {
        testthat::expect_equal(solution(n), translator_sol(n))
    }
})

testthat::test_that("random test cases", {
    for (i in 1:100) {
        n <- stats::rnorm(1, mean = 250, sd = 100)
        testthat::expect_equal(
            solution(n), translator_sol(n)
        )
    }
})