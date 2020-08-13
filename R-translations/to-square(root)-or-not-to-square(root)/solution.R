library(dplyr)

square_or_square_root <- function(vec) {
    dplyr::case_when(
        # if the fractional part of root is 0, take the root
        (vec**.5) %% 1 == 0 ~ vec ** .5,
        # otherwise square it
        TRUE ~ vec ** 2)
}