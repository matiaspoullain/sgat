test_that("multiplication works", {
  initialization_sgat()
  expect_match(class(remDr), "remoteDriver")
})
