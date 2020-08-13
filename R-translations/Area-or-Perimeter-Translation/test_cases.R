library(testthat)

# sample
test_that("example", {
    testthat::expect_equal(area_or_perimeter(4, 4), 16)
    testthat::expect_equal(area_or_perimeter(6, 10), 32)
})

# extended tests
translator_solution <- function(l, w) {
    return (
        base::ifelse(l == w, l * w, 2 * (l+1))
    )
}


testthat::test_that("not so fixed tests", {
    for (i in 1:100) {
        a <- (i * 1200) + 2
        b <- (i * 2100) + 2
        testthat::expect_equal(
            area_or_perimeter(a, b), translator_solution(a, b))
    }
    for (i in 1:100) {
        a <- (i * 100) + 20
        b <- (i * 100) + 20 
        testthat::expect_equal(
            area_or_perimeter(a, b), translator_solution(a, b))
    }
})

testthat::test_that("random tests", {
    for (i in 1:200) {
        a <- base::floor(runif(1, 100, 1201))
        
        # simulate a coin flip (Bernoulli(p = .5))
        # in the ifelse, allowing the creation of
        # randomised squares half the time
        # credit for suggestion: @hobovsky
        b <- base::ifelse(
            stats::rbinom(1, 1, prob = .5),
            a,
            floor(runif(1, 100, 1501))
        testthat::expect_equal(
            area_or_perimeter(a, b), translator_solution(a, b))
    }
})