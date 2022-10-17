# Auxiliary functions ----------------------------------------------------------

#' check whether an object is null, but returns FALSE if error occurs
#'
#' @return
#' @export
#'
#' @examples
safe_null <- function() {
  purrr::safely(is.null,otherwise = FALSE)
}

aes <- ggplot2::aes()

comma <- scales::comma()

`%>%` <- magrittr::`%>%`
