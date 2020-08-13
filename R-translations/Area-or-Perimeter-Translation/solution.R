# set up
area_or_perimeter <- function(l, w) {
    # TODO:
}

# answer
area_or_perimeter <- function(l, w) {
    return (
        base::ifelse(l == w, l * w, 2 * (l+1))
    )
}