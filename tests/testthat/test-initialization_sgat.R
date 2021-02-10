try(initialization_sgat(geckover = "0.28.0"), silent = TRUE)

test_that("Driver initializes", {
  expect_match(class(remDr), "remoteDriver")
})

test_that("canShowErrorClass", {
  status <- remDr$showErrorClass()$status
  expect_equal(status, 0L)
})

test_that("canShowRemoteDriver", {
  expect_equal(remDr$show()$browserName, "firefox")
})

test_that("canGetStatus", {
  status <- remDr$getStatus()
  expect_identical(names(status), c("ready", "message", "build", "os", "java"))
})
