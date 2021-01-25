initialization_sgat()

test_that("gives correct data frame if information is found", {
  coutume <- sgat("coutume, 47 rue de babylone, 75007 paris, france")
  expect_is(coutume.martes, "data.frame")
  expect_identical(unique(coutume.martes$lugar), "coutume, 47 rue de babylone, 75007 paris, france")
  expect_lt(max(coutume.martes$hora), 24)
  expect_gt(min(coutume.martes$hora), 0)
  expect_is(coutume.martes$latitud, "numeric")
  expect_is(coutume.martes$longitud, "numeric")
})

test_that("gives NULL if information is not found", {
  expect_warning(moustacchio <- sgat("Moustacchio, San Martín 298, Ushuaia, Argentina"))
  expect_null(moustacchio)
})

test_that("error if no lugar.a.buscar and or dia.seman typed", {
  expect_error(sgat())
})

