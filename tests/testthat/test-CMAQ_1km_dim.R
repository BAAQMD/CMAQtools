test_that("CMAQ_1km_dim()", {
  expect_equal(CMAQ_1km_dim(), c(row = 224L, col = 164L))
})
