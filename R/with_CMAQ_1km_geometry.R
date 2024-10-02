#' with_CMAQ_1km_geometry
#'
#' @param .data must contain columns given by [CMAQ_id_vars()]
#' @param relationship see [dplyr::left_join()]; default is "one-to-one"
#'
#' @return sf object with cell geometries
#' @export
with_CMAQ_1km_geometry <- function (
    .data,
    by = CMAQ_id_vars(),
    relationship = "one-to-one"
) {
  left_join(
    select(CMAQ_1km_geodata(), all_of(by)),
    .data,
    by = by,
    relationship = relationship)
}
