#' CMAQ_1km_crs
#'
#' Return a CRS object corresponding to 1 km CMAQ models
#'
#' @export
CMAQ_1km_crs <- function () {
  st_crs(CMAQ_1km_proj4string())
}
