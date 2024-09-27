test_that("CMAQ_1km_row_from()", {
  cells <- 1:10
  expect_equal(CMAQ_1km_row_from(cells), rep(224, length(cells)))
})
