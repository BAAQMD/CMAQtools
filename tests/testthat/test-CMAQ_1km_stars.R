test_that("CMAQ_1km_stars()", {

  st_obj <- CMAQ_1km_stars()

  expect_s3_class(st_obj, "stars")

  expect_equal(
    st_crs(st_obj)$wkt,
    CMAQ_1km_crs()$wkt)

  expect_setequal(
    names(tibble::as_tibble(st_obj)),
    c("x", "y", "CMAQ_row", "CMAQ_col"))

})
