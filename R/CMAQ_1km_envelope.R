#' CMAQ_1km_envelope
#'
#' Envelope of 1 km CMAQ domain
#'
#' @return sf object
#' @export
CMAQ_1km_envelope <- function () {
  rst_obj <- CMAQ_1km_raster()
  return(st_envelope(rst_obj))
}
