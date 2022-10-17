library(purrr)

# Auxiliary functions ----------------------------------------------------------
safe_null <- safely(is.null,otherwise = FALSE)

