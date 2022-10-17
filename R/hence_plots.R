#' Build a beautiful looking table
#'
#' @param p_dados a data.frame or data.table
#' @param p_align alignment of text inside table ("c" for center,"r" for right and "l" for left)
#' @param p_font_size
#' @param p_row_names logical indicating wether or not to include row names in table
#'
#' @return
#' @export
#'
#' @examples
hence_table <- function(p_dados,
                        p_align = "c",
                        p_font_size = 18,
                        p_row_names = FALSE) {
  tabela <-
    kableExtra::kbl(p_dados,
                    align = p_align,
                    row.names = p_row_names) %>%
    kableExtra::kable_classic(lightable_options = "hover") %>%
    kableExtra::kable_styling(font_size = p_font_size)
  return(tabela)
}


#' Plot a histogram
#'
#' @param p_dados a numeric vector
#' @param p_fill hex code to fill histogram bars
#' @param p_xlab x axis label
#' @param p_ylab y axis label
#' @param p_title title
#' @param p_subtitle subtitle
#'
#' @return
#' @export
#'
#' @examples
hence_histogram <- function(p_dados,
                            p_fill = "#300030",
                            p_xlab = "",
                            p_ylab = "",
                            p_title = "",
                            p_subtitle = ""){

  df <- data.frame(x = p_dados)
  p <-
    ggplot2::ggplot(df, aes(x = x)) +
    ggplot2::geom_histogram(binwidth = density(df$x)$bw,
                   fill = p_fill) +
    theme_hence() +
    ggplot2::xlab(p_xlab) +
    ggplot2::ylab(p_ylab)  +
    ggplot2::ggtitle(p_title,
            subtitle = p_subtitle) +
    scales::scale_x_continuous(labels = comma)
  return(p)
}


#' Plot line charts
#'
#' @param p_dados a data.table
#' @param p_x varible to be displayed in x axis
#' @param p_y variable to be displayed in y axis
#' @param p_color variable to color lines
#' @param p_group variable to group lines
#' @param p_fill hex to fill line chart
#' @param p_xlab x axis label
#' @param p_ylab y axis label
#' @param p_title title of the chart
#' @param p_subtitle subtitle of the chart
#'
#' @return
#' @export
#'
#' @examples
hence_line_chart <- function(p_dados,
                             p_x,
                             p_y,
                             p_color = NULL,
                             p_group = NULL,
                             p_color_value = "#300030",
                             p_colors_values = c("#300030","#e28743"),
                             p_xlab = "",
                             p_ylab = "",
                             p_title = "",
                             p_subtitle = ""){


  if (p_xlab == "") {
    xlabel <-  deparse(substitute(p_x))
  } else {
    xlabel <- p_xlab
  }

  if (p_ylab == "") {
    ylabel <-  deparse(substitute(p_y))
  } else {
    ylabel <- p_ylab
  }


  if (safe_null(p_color) %>% pluck("result")) {
    linha <- ggplot2::geom_line(color = p_color_value)
    cores_grupos <- NULL
  } else {
    linha <- ggplot2::geom_line()
    cores_grupos <-
      ggplot2::scale_color_manual(values = p_colors_values)
  }

  p_dados %>%
    ggplot2::ggplot(aes(x = {{ p_x }},
               y = {{ p_y }},
               color = {{ p_color }},
               group = {{ p_group }})
    ) +
    linha +
    cores_grupos +
    theme_hence() +
    ggplot2::xlab(xlabel) +
    ggplot2::ylab(ylabel)  +
    ggplot2::ggtitle(p_title,
            subtitle = p_subtitle) +
    scales::scale_x_continuous(labels = comma) -> p
  return(p)
}

