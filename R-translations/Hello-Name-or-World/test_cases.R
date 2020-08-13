# sample test cases -------------
library(testthat)
library(purrr)

testthat::test_that("basic tests", {
    testthat::expect_equal("John", "Hello, John!")
    testthat::expect_equal("aLIce", "Hello, Alice!")
    testthat::expect_equal("", "Hello, World!")
})

# test cases --------------
names <- c(
    "James", "Christopher", "Ronald", "Mary", "Lisa", "Michelle",
    "John", "Daniel", "Anthony", "Patricia", "Nancy", "Laura",
    "Robert", "Paul", "Kevin", "Linda", "Karen", "Sarah", "Michael",
    "Mark", "Jason", "Barbara", "Betty", "Kimberly", "William", "Donald",
    "Jeff", "Elizabeth", "Helen", "Deborah", "David", "George", "Jennifer",
    "Sandra", "Richard", "Kenneth", "Maria", "Donna", "Charles", "Steven",
    "Susan", "Carol", "Joseph", "Edward", "Margaret", "Ruth", "Thomas",
    "Brian", "Dorothy", "Sharon", ""
)

randomise_case <- function(char) {
    # approx 2/3 letters will be upper case
    # NB: this function randomises the CASE (upper or lower)
    #     of the input character. This is not
    #     responsible for randomising test cases
    return (
        base::ifelse(
            runif(1, 0, 1) > .3333,
            stringr::str_to_upper(char),
            stringr::str_to_lower(char))
    )
}

create_test_case <- function() {
    test_case <- base::sample(x = names, size = 1)
    test_case_split <- str_split("sadasds", pattern = "")[[1]]
    test_case_final <- purrr:map_chr(test_case_split, randomise_case)
    return (test_case_final)
}

testthat::test_that("random tests", {
    sol <- function(name = "") {
        # translator's correct solution
        var <- base::ifelse(
            name == "",
            "World",
            stringr::str_to_title(name))
        return (base::sprintf("Hello, %s!", var))
    }
    for (i in 1:100) {
        test_case <- create_test_case()
        testthat::expect_equal(hello(test_case), sol(test_case))
    }
})