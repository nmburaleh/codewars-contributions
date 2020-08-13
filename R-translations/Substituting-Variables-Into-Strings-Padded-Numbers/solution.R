solution <- function(value) {
    value_padded <- stringr::str_pad(value, 5, 'left', '0')
    return (stringr::str_interp("Value is ${value_padded}"))
}