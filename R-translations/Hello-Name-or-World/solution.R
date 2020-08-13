hello <- function(name = "") {
    var <- base::ifelse(
        name == "",
        "World",
        stringr::str_to_title(name)
    )
    return (base::sprintf("Hello, %s!", var))
}