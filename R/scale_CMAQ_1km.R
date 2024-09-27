#' scale_CMAQ_1km
#'
#' @param ... passed to [ggplot2::scale_x_continuous()] and [ggplot2::scale_x_continuous()]
#' @param breaks see [ggplot2::scale_continuous]
#' @param expand
#'
#' @return list of two scale objects, one for x and one for y
#' @export
scale_CMAQ_1km <- function (
    names = c("CMAQ_col", "CMAQ_row"),
    ...,
    breaks = seq(0, 300, by = 20),
    expand = expansion(add = c(3, 3), mult = c(0, 0))
) {
  list(
    scale_x_continuous(
      name = names[1],
      expand = expand,
      breaks = breaks,
      ...),
    scale_y_continuous(
      name = names[2],
      expand = expand,
      breaks = breaks,
      ...))
}
