#' CMAQ_1km_stars
#'
#' Create a `stars` object with default 1km CRS and dimensions
#'
#' @param ... passed to [CMAQ_1km_raster()]
#'
#' @importFrom stars st_as_stars
#'
#' @aliases CMAQ_1km_stobj
#'
#' @return stars object
#' @export
CMAQ_1km_stars <- function (...) {
  rst_obj <- CMAQ_1km_raster(...)
  st_obj <- stars::st_as_stars(rst_obj)
  st_obj <- split(st_obj)
  return(st_obj)
}

#' @export
CMAQ_1km_stobj <- CMAQ_1km_stars
