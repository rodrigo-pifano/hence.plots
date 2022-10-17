#' ggplot theme using Hence standards
#'
#' @param p_base_size
#' @param p_pase_family
#' @param p_line_colour
#'
#' @return
#' @export
#'
#' @examples
theme_hence <-
  function(p_base_size = 15,
           p_pase_family = "Arial",
           p_line_colour = "grey") {

    ggplot2::theme_bw(base_size = p_base_size,
                      base_family = p_pase_family) +
      ggplot2::theme(axis.line = ggplot2::element_line(colour = p_line_colour),
                     panel.border = ggplot2::element_blank())
  }
