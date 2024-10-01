#' CMAQ_1km_raster
#'
#' @param dim two-element numeric vector, as from [CMAQ_1km_dim()]
#' @param crs CRS object, as from [CMAQ_1km_crs()]
#'
#' @return [terra::rast] object
#' @export
CMAQ_1km_raster <- function (
    dim = CMAQ_1km_dim(),
    crs = CMAQ_1km_crs()
) {

  ncol <- dim["col"]
  nrow <- dim["row"]

  rst_obj <-
    terra::rast(
      ncols = ncol,
      nrows = nrow,
      xmin  = 0,
      ymin  = 0,
      xmax  = ncol,
      ymax  = nrow)

  terra::crs(rst_obj) <-
    crs$wkt

  CMAQ_row <-
    rev(
      rep(1:nrow, each = ncol))

  CMAQ_col <-
    rep(1:ncol, times = nrow)

  rst_obj$CMAQ_row <- CMAQ_row
  rst_obj$CMAQ_col <- CMAQ_col

  return(rst_obj)

}
