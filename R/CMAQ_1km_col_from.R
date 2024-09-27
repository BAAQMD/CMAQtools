#' CMAQ_1km_col_from
#'
#' @param cell integer
#'
#' @importFrom terra colFromCell
#'
#' @return integer
#' @export
CMAQ_1km_col_from <- function (cell) {
  rst_obj <- CMAQ_1km_raster()
  j <- terra::colFromCell(rst_obj, cell)
  return(j)
}
