initialization_sgat()

test_that("gives correct data frame if information is found", {
  coutume <- sgat("coutume, 47 rue de babylone, 75007 paris, france")
  expect_is(coutume, "data.frame")
  expect_identical(unique(coutume$lugar), "coutume, 47 rue de babylone, 75007 paris, france")
  expect_lt(max(coutume$hora), 24)
  expect_gt(min(coutume$hora), 0)
  expect_is(coutume$latitud, "numeric")
  expect_is(coutume$longitud, "numeric")
})

test_that("gives NULL if information is not found", {
  expect_null(moustacchio <- sgat("Moustacchio, San Martín 298, Ushuaia, Argentina"))
})

test_that("error if no lugar.a.buscar and or dia.seman typed", {
  expect_error(sgat())
})

