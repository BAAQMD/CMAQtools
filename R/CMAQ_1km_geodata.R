#' CMAQ_1km_geodata
#'
#' Create a `sf` object with default 1km CRS and dimensions
#'
#' @param ... passed to [CMAQ_1km_raster()]
#'
#' @importFrom terra as.polygons
#' @importFrom sf st_as_sf
#' @importFrom tibble as_tibble
#'
#' @return sf object
#' @export
CMAQ_1km_geodata <- function (...) {
  rst_obj <- CMAQ_1km_raster(...)
  vect_obj <- terra::as.polygons(rst_obj, aggregate = FALSE)
  sf_obj <- sf::st_as_sf(vect_obj)
  return(st_sf(tibble::as_tibble(sf_obj)))
}
