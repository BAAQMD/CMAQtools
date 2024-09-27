#' CMAQ_1km_row_from
#'
#' @param cell integer
#' @param warn logical
#'
#' @importFrom terra rowFromCell nrow
#'
#' @return integer
#' @export
CMAQ_1km_row_from <- function (cell, warn = TRUE) {
  rst_obj <- CMAQ_1km_raster()
  i <- terra::rowFromCell(rst_obj, cell)
  if (isFALSE(warn)) warning("reversing row indices to follow CMAQ convention")
  return(terra::nrow(rst_obj) + 1 - i)
}
