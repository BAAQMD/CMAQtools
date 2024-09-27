#' theme_CMAQ_1km
#'
#' @param ... passed to [ggtools::theme_simple()]
#' @param gridlines logical
#'
#' @importFrom ggplot2 theme
#' @importFrom ggtools theme_simple theme_remove
#'
#' @return theme object, as from [ggplot2::theme()]
#' @export
theme_CMAQ_1km <- function (
    ...,
    gridlines = TRUE
) {

  theme_obj <-
    ggtools::theme_simple(
      ...) +
    ggtools::theme_gridlines() +
    ggplot2::theme(
      # strip.text.x = element_textbox(
      #   face = "bold", hjust = 0, size = rel(1.2), margin = margin(t=1, b=0.5, unit="line")),
      #plot.title = element_textbox(face = "bold"),
      plot.margin = margin(), # zeros
      legend.margin = margin(), # zeros
      panel.spacing = unit(0, "pt"),
      legend.position = "inside",
      legend.position.inside = c(0.20, 0.20),
      legend.justification = c(1, 0),
      legend.title.align = 1,
      legend.box.just = "right",
      legend.title = element_text(
        hjust = 1,
        margin = margin(b=0.5, unit="line")),
      axis.ticks.x = element_blank(),
      axis.ticks.y = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.text = element_text(
        color = gray(0.6)),
      panel.grid.major = element_line(
        linewidth = 0.3,
        color = gray(0.6),
        linetype = "dotted"),
      axis.line.x = element_blank(),
      axis.line.y = element_blank())

  if (isFALSE(gridlines)) {
    theme_obj <-
      theme_obj +
      ggplot2::theme(
        legend.background = element_rect(fill = TRANSPARENT)) +
      ggtools::theme_remove(
        "panel", "grid", "major", c("x", "y"))
  }

  return(theme_obj)

}
