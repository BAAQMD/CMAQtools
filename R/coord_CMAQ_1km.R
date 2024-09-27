#' coord_CMAQ_1km
#'
#' For use with `ggplot()`, a projected `ccord_sf`
#'
#' @param xlim two-valued numeric vector
#' @param ylim two-valued numeric vector
#' @param crs CRS object, as from `CMAQ_1km_crs()`
#' @param datum CRS object, as from `CMAQ_1km_crs()`
#' @param ... passed to [ggplot2::coord_sf()]
#'
#' @export
coord_CMAQ_1km <- function (
    xlim = c(NA, NA),
    ylim = c(NA, NA),
    crs = CMAQ_1km_crs(),
    datum = CMAQ_1km_crs(),
    ...
) {

  if (is.na(xlim[1])) xlim[1] <- 0
  if (is.na(ylim[1])) ylim[1] <- 0

  if (is.na(xlim[2])) {
    xlim[2] <- CMAQ_1km_dim()[2]
  }

  if (is.na(ylim[2])) {
    ylim[2] <- CMAQ_1km_dim()[1]
  }

  coord_sf(
    xlim = xlim,
    ylim = ylim,
    crs = crs,
    datum = datum,
    ...)

}
