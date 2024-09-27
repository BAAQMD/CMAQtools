test_that("CMAQ_1km_col_from()", {
  cells <- 1:10
  expect_equal(CMAQ_1km_col_from(cells), 1:10)
})
