test_that("gives vector", {
  expect_is(restaurants <- ushuaia_restaurants(), "character")
  expect_gt(length(restaurants), 100)
})
