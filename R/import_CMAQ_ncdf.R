#' import_CMAQ_ncdf
#'
#' Import a NetCDF file containing CMAQ model output.
#'
#' The result is a [stars::stars] object, with coordinates indexed by `CMAQ_col` and `CMAQ_row`.
#'
#' @details The assumed projection is Lambert Conformal Conic (LCC), with parameters partially determined
#' by the globals contained in the NetCDF file.
#'
#' @note The coordinates of the `stars` raster are "nudged" by half a unit (e.g., kilometer) in both the x and y dimensions.
#'
#' @importFrom ncmeta nc_atts nc_vars
#' @importFrom stars read_ncdf st_set_dimensions st_set_bbox
#' @importFrom sf st_bbox st_crs
#' @importFrom units set_units
#' @importFrom dplyr pull
#'
#' @param path (character) single NetCDF file
#' @param variables (character) like `c("PM25_TOT", "PM25_PRI", "PM25_SEC")`
#' @param cell_midpoints (logical) passed to [stars::st_set_dimensions()]
#' @param point (logical) passed to [stars::st_set_dimensions()]
#' @param nudge_x (numeric) final adjustment to coordinates
#' @param nudge_y (numeric) final adjustment to coordinates
#'
#' @export
import_CMAQ_ncdf <- function (
    path,
    variables = NULL,
    cell_midpoints = TRUE,
    point = FALSE,
    nudge_x = -0.5,
    nudge_y = -0.5,
    units = FALSE,
    ...
) {

  ncdf_attrs <- ncmeta::nc_atts(path)
  ncdf_globals <- pull(ncdf_attrs, value)

  crs_proj4string <-
    with(ncdf_globals,
         geotools:::proj4string_LCC(
           lon_0 = XCENT,
           lat_0 = YCENT,
           lat_1 = P_ALP,
           lat_2 = P_BET,
           x_0 = -1 * XORIG,
           y_0 = -1 * YORIG,
           a = 6370000,
           b = 6370000,
           datum = "NAD83",
           ellps = "GRS80",
           unit = "km"))

  ncdf_variables <-
    ncmeta::nc_vars(path)$name

  if (is.null(variables)) {
    variables <- setdiff(ncdf_variables, c("TSTEP", "TFLAG"))
  }

  variables <-
    intersect(variables, ncdf_variables)

  if (!isFALSE(units)) {
    if (is.null(names(units))) {
      units <- rep(units, length(variables))
      names(units) <- variables
    } else {
      stopifnot(is.character(units))
      stopifnot(any(names(units) %in% variables))
    }
  }

  CMAQ_stobj <- local({

    imported <-
      withCallingHandlers({

        stars::read_ncdf(
          path,
          var = variables,
          make_units = isFALSE(units))

      }, warning = function (w) {

        IGNORED_WARNINGS <- c(
          "No projection information found",
          "ignoring unrecognized unit")

        if (str_detect_any(conditionMessage(w), IGNORED_WARNINGS)) {
          invokeRestart("muffleWarning")
        }

      })

    imported %>%
      .[,,,drop=TRUE] %>% # drop the LAY and TSTEP dimensions
      stars::st_set_dimensions("ROW", name = "CMAQ_row") %>%
      stars::st_set_dimensions("COL", name = "CMAQ_col") %>%
      stars::st_set_dimensions("CMAQ_row", point = point) %>%
      stars::st_set_dimensions("CMAQ_col", point = point)

  })

  for (nm in names(units)) {
    CMAQ_stobj[[nm]] <- set_units(CMAQ_stobj[[nm]], units[[nm]], mode = "character")
  }

  st_crs(CMAQ_stobj) <-
    crs_proj4string

  nudged_bbox <-
    st_bbox(CMAQ_stobj) + c(nudge_x, nudge_x, nudge_y, nudge_y)

  CMAQ_stobj <-
    stars::st_set_bbox(
      CMAQ_stobj,
      nudged_bbox)

  return(CMAQ_stobj)

}
