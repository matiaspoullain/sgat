initialization_sgat()

test_that("gives correct data frame if information is found", {
  coutume.martes <- sgat_day("coutume, 47 rue de babylone, 75007 paris, france", "martes")
  expect_ids(coutume.martes, "data.frame")
  expect_identical(unique(coutume.martes$lugar), "coutume, 47 rue de babylone, 75007 paris, france")
  expect_identical(unique(coutume.martes$dia), "martes")
  expect_lt(max(coutume.martes$hora), 24)
  expect_gt(min(coutume.martes$hora), 0)
  expect_is(coutume.martes$latitud, "numeric")
  expect_is(coutume.martes$longitud, "numeric")
})

test_that("gives message if information is not found", {
  expect_warning(moustacchio.jueves <- sgat_day("Moustacchio, San Martín 298, Ushuaia, Argentina", "jueves"))
  expect_identical(moustacchio.jueves, "Sin datos de concurrencia")
})

test_that("error if no lugar.a.buscar and or dia.seman typed", {
  expect_error(sgat_day(dia.semana = "viernes"))
  expect_error(sgat_day(lugar.a.buscar = "coutume, 47 rue de babylone, 75007 paris, france"))
})
