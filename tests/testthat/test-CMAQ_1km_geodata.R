test_that("CMAQ_1km_geodata()", {

  sf_obj <- CMAQ_1km_geodata()

  expect_s3_class(sf_obj, "sf")

  expect_equal(
    st_crs(sf_obj)$wkt,
    CMAQ_1km_crs()$wkt)

  expect_setequal(
    names(st_drop_geometry(sf_obj)),
    c("CMAQ_row", "CMAQ_col"))

  expect_equal(
    head(st_drop_geometry(sf_obj), 10),
    tibble::tibble(CMAQ_row = 224L, CMAQ_col = 1:10))

})
