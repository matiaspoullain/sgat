## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

## ----example, message=FALSE, warning=FALSE------------------------------------
library(sgat)
initialization_sgat()

## ----restaurants, message=FALSE, warning=FALSE--------------------------------
restaurants <- ushuaia_restaurants()
head(restaurants)

