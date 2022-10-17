source("./R/hence_plots.R")
library(data.table)
# hence_table ------------------------------------------------------------------
mtcars %>%
  as.data.table(keep.rownames = T) %>%
  hence_table()
# hence_histogram --------------------------------------------------------------
hence_histogram(mtcars$mpg,
                p_title = "Histogram example",
                p_xlab = "X label test",
                p_ylab = "counts") %>%
  ggplotly
# hence_line_chart -------------------------------------------------------------
## single ----------------------------------------------------------------------
hence_line_chart(p_dados = mtcars,
                 p_x = hp,
                 p_y = mpg,
                 p_title = "Line chart example") %>%
  ggplotly
## grouped ---------------------------------------------------------------------
# Ex1
hence_line_chart(p_dados = mtcars %>% mutate(am = as.factor(am))
                 ,p_x = hp,p_y = mpg,
                 p_color = am,
                 p_title = "Grouped line chart example") %>%
  ggplotly
# Ex2
hence_line_chart(p_dados = mtcars %>% mutate(gear = as.factor(gear))
                 ,p_x = hp,p_y = mpg,
                 p_color = gear,
                 p_title = "Grouped line chart example",
                 p_colors_values = c("green","blue","red")) %>%
  ggplotly
# Different types --------------------------------------------------------------
# Use theme_hence to generate different chart types
mtcars %>%
  ggplot(aes(x = am,y = disp)) +
  geom_bar(stat = "identity") +
  theme_hence()
# customize parameters in theme
mtcars %>%
  ggplot(aes(x = am,y = disp)) +
  geom_bar(stat = "identity", fill = "dark green") +
  theme_hence(p_base_size = 20,
              p_pase_family = "Times New Roman",
              p_line_colour = "blue")
#
mtcars %>%
  ggplot(aes(x = mpg)) +
  geom_density() +
  theme_hence(p_base_size = 20,
              p_pase_family = "Times New Roman",
              p_line_colour = "blue")
#
mtcars %>%
  ggplot(aes(x = mpg,y = qsec)) +
  geom_density_2d_filled() +
  theme_hence()




