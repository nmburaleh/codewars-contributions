# set up
solution <- function(a, b) {
    # TODO:
}

# translator solution
library(stringr)

solution <- function(a, b) {
    return (
        base::ifelse(
            nchar(a) < nchar(b),
            stringr::str_interp("${a}${b}${a}"),
            stringr::str_interp("${b}${a}${b}")
        )
    )
}