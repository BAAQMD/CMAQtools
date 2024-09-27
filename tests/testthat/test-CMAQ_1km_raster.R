test_that("CMAQ_1km_raster()", {

  rst_obj <- CMAQ_1km_raster()
  rst_dim <- dim(rst_obj)

  expect_equal(rst_dim[1], 224)
  expect_equal(rst_dim[2], 164)

  expect_setequal(
    names(rst_obj),
    c("CMAQ_row", "CMAQ_col"))

  expect_equal(
    head(tibble::as_tibble(CMAQ_1km_raster()), 10),
    tibble::tibble(
      CMAQ_row = 224L,
      CMAQ_col = 1:10L))

})
