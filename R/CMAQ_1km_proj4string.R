CMAQ_1km_proj4string <- function (...) {
  geotools:::proj4string_LCC(
    lat_1 = 30,
    lat_2 = 60,
    lat_0 = 37,
    lon_0 = -120.5,
    y_0   = 16e3,
    x_0   = 220e3,
    a     = 6.37e6,
    b     = 6.37e6,
    units = "km",
    ...)
}
