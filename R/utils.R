# Auxiliary functions ----------------------------------------------------------


safe_null <- purrr::safely(is.null, otherwise = FALSE)

aes <- ggplot2::aes

comma <- scales::comma

`%>%` <- magrittr::`%>%`
