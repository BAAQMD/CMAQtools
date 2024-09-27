#' CMAQ_1km_figure
#'
#' Create base for ggplot2 figure, using:
#'
#' - [scale_CMAQ_1km()]
#' - [theme_CMAQ_1km()]
#'
#' @param ... passed to [ggplot2::ggplot()]
#' @param gridlines
#'
#' @importFrom units drop_units
#' @importFrom ggplot2 guides guide_colorbar
#' @importFrom strtools str_draft
#'
#' @return ggplot2 object
#' @export
CMAQ_1km_figure <- function (
    data = NULL,
    mapping = aes(),
    ...,
    drop_units = TRUE,
    gridlines = TRUE
) {

  if (isTRUE(drop_units) && isFALSE(is.null(data))) {
    data <- units::drop_units(data)
  }

  fig_guides <-
    ggplot2::guides(
      fill = ggplot2::guide_colorbar(
        barheight = unit(6, "line"),
        barwidth = unit(0.6, "line"),
        label.position = "left",
        label.hjust = 1))

  fig_theme <-
    theme_CMAQ_1km(
      gridlines = gridlines)

  fig_description <-
    labs(caption = strtools::str_draft())

  fig_obj <-
    ggplot(data = data, mapping = mapping, ...) +
    fig_theme +
    fig_guides +
    fig_description +
    scale_CMAQ_1km() +
    coord_CMAQ_1km()

  return(fig_obj)

}
