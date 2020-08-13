# example test cases -------------------
library(testthat)

testthat::test_that("example test cases", {
    testthat::expect_equal(solution('45', '1'), '1451')
    testthat::expect_equal(('13', '200'), '1320013')
    testthat::expect_equal(('Soon', 'Me'), 'MeSoonMe')
    testthat::expect_equal(('U', 'False'), 'UFalseU')
})


# test cases --------------------------
library(testthat)
library(stringr)

translator_sol <- function(a, b) {
    return (
        base::ifelse(
            nchar(a) < nchar(b),
            stringr::str_interp("${a}${b}${a}"),
            stringr::str_interp("${b}${a}${b}")
        )
    )
}

make_random_word <- function() {
    rword <- sample(letters, runif(1, 5, 14), replace = TRUE)
    return (
        stringr::str_c(rword, collapse = "")
    )
}

testthat::test_that("random tests", {
    for (i in 1:200) {
        rword1 <- make_random_word()
        rword2 <- sample(letters, runif(1, 5, 14), replace = TRUE)
        
        # guard clause to guarantee differing no. characters
        if (nchar(rword1) == nchar(rword2)) {next}
        
        # main business logic
        testthat::expect_equal(
            solution(rword1, rword2),
            translator_sol(rword1, rword2)
        )
    }
})