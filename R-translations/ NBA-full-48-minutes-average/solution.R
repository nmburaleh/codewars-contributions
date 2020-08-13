nba_extrap <- function(ppg, mpg) {
    ifelse(mpg > 0,
           base::round(ppg * (48 / mpg), digits = 1),
           0)
}