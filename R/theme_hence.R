library(ggplot2)
library(ggthemes)

theme_hence <-
  function(p_base_size = 15,
           p_pase_family = "Arial",
           p_line_colour = "grey") {

    theme_bw(base_size = p_base_size,
             base_family = p_pase_family) +
      theme(axis.line = element_line(colour = p_line_colour),
            panel.border = element_blank())
  }
