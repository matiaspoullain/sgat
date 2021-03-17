testthat::skip_on_cran()
testthat::skip_if_offline(host = "r-project.org")

test_that("gives correct data frame for single country", {
  skip_on_cran()
  skip_if_offline(host = "r-project.org")
  argentina <- mobility_var("AR")
  expect_s3_class(argentina, "data.frame")
  expect_identical(unique(argentina$country_region_code), "AR")
})

test_that("gives correct data frame for several countries", {
  skip_on_cran()
  skip_if_offline(host = "r-project.org")
  northAmerica <- mobility_var(c("CA", "US", "MX"))
  expect_s3_class(northAmerica, "data.frame")
  expect_identical(unique(northAmerica$country_region_code), c("CA", "US", "MX"))
})

test_that("gives correct data frame for all availables countries", {
  skip_on_cran()
  skip_if_offline(host = "r-project.org")
  allCountries <- mobility_var("All")
  expect_s3_class(allCountries, "data.frame")
})


test_that("error if typed country.code is not one from countries.codes list", {
  expect_error(mobility_var("bad example"))
})

test_that("error if country.code is not specified", {
  expect_error(mobility_var("bad example"))
})
