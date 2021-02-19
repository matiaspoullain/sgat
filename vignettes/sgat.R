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

## ----bar 1.1, message=FALSE, warning=FALSE------------------------------------

bar_1 <- sgat("coutume, 47 rue de babylone, 75007 paris, france", tiempo.espera = 20)
head(bar_1)

## ----bar 2.2, echo = TRUE, message=FALSE, warning=FALSE-----------------------
bar_2 <- sgat("Moustacchio, San Martín 298, Ushuaia", tiempo.espera = 20)
bar_2

## ----bar 3.2, message=FALSE, warning=FALSE------------------------------------
bar_3 <- sgat_day("coutume, 47 rue de babylone, 75007 paris, france", "martes")
head(bar_3)

## ----tripadvisor, message=FALSE, warning=FALSE--------------------------------
pinamar <- tripadvisor_places("Pinamar", 10)
pinamar

