initialization_sgat()

test_that("gives correct character vector if information is found", {
  pinamar <- tripadvisor_places("Pinamar, Argentina", 10)
  expect_is(pinamar, "character")
  expect_length(pinamar, 10)
})

test_that("gives NA if information is not found", {
  bad_example <- tripadvisor_places("fjkla")
  expect_is(bad_example, "character")
  expect_length(bad_example, 1)
})
