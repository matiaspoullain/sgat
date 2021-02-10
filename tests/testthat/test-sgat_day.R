try(initialization_sgat(geckover = "0.28.0"), silent = TRUE)


test_that("gives correct data frame if information is found", {
  coutume.martes <- sgat_day("coutume, 47 rue de babylone, 75007 paris, france", "martes")
  expect_is(coutume.martes, "data.frame")
  expect_identical(unique(coutume.martes$lugar), "coutume, 47 rue de babylone, 75007 paris, france")
  expect_identical(unique(coutume.martes$dia), "martes")
  expect_lt(max(coutume.martes$hora), 24)
  expect_gt(min(coutume.martes$hora), 0)
  expect_is(coutume.martes$latitud, "numeric")
  expect_is(coutume.martes$longitud, "numeric")
})

test_that("gives message if information is not found", {
    expect_identical(sgat_day("Moustacchio, San Martín 298, Ushuaia, Argentina", "jueves"), "Sin datos de concurrencia")
})

test_that("error if lugar.a.buscar and or dia.semana is not typed", {
  expect_error(sgat_day(dia.semana = "viernes"))
  expect_error(sgat_day(lugar.a.buscar = "coutume, 47 rue de babylone, 75007 paris, france"))
})
