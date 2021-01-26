
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sgat

<!-- badges: start -->

<!-- badges: end -->

The goal of sgat package is to retrieve information from Google’s
searches’ “Popular Times” and geolocation.

## Installation

You can install the released version of sgat package from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("sgat")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("matiaspoullain/sgat")
```

## Example

Always start by initializing the driver, once per session:

``` r
library(sgat)
initialization_sgat()
#> [1] "Connecting to remote server"
#> [1] "Connecting to remote server"
#> $acceptInsecureCerts
#> [1] FALSE
#> 
#> $browserName
#> [1] "firefox"
#> 
#> $browserVersion
#> [1] "84.0.2"
#> 
#> $`moz:accessibilityChecks`
#> [1] FALSE
#> 
#> $`moz:buildID`
#> [1] "20210105180113"
#> 
#> $`moz:geckodriverVersion`
#> [1] "0.28.0"
#> 
#> $`moz:headless`
#> [1] FALSE
#> 
#> $`moz:processID`
#> [1] 27120
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileY6lAZW"
#> 
#> $`moz:shutdownTimeout`
#> [1] 60000
#> 
#> $`moz:useNonSpecCompliantPointerOrigin`
#> [1] FALSE
#> 
#> $`moz:webdriverClick`
#> [1] TRUE
#> 
#> $pageLoadStrategy
#> [1] "normal"
#> 
#> $platformName
#> [1] "windows"
#> 
#> $platformVersion
#> [1] "10.0"
#> 
#> $rotatable
#> [1] FALSE
#> 
#> $setWindowRect
#> [1] TRUE
#> 
#> $strictFileInteractability
#> [1] FALSE
#> 
#> $timeouts
#> $timeouts$implicit
#> [1] 0
#> 
#> $timeouts$pageLoad
#> [1] 300000
#> 
#> $timeouts$script
#> [1] 30000
#> 
#> 
#> $unhandledPromptBehavior
#> [1] "dismiss and notify"
#> 
#> $webdriver.remote.sessionid
#> [1] "0ed0d3a2-bb54-4aa2-bf6b-c6d83607670a"
#> 
#> $id
#> [1] "0ed0d3a2-bb54-4aa2-bf6b-c6d83607670a"
```

This package was created to use it on restaurants, bars, etc… located in
Ushuaia city, Tierra del Fuego, Argentina. You can retrieve a vector of
them by using the next code:

``` r
restaurants <- ushuaia_restaurants()
head(restaurants)
#> [1] "Moustacchio, San Martín 298, Ushuaia"              
#> [2] "Prana, Av Maipu 505, Ushuaia"                      
#> [3] "La Cabaña Casa de Té, Luis F Martial 3560, Ushuaia"
#> [4] "Kuar, Av Perito Moreno 2232, Ushuaia"              
#> [5] "La Cabaña, Luis Fernando Martial 3550, Ushuaia"    
#> [6] "Kuar 1900, San Martín 471, Ushuaia"
```

You can retrieve the information from some of these restaurants. A csv
file will be created in the “CSVs Concurrencias” directory by default.
The file’s name is the string you looked for.

``` r
bar_1 <- sgat("Kuar 1900 Bar, San Martín 471, Ushuaia", carpeta.guardado = "CSVs Concurrencias")
```

``` r
head(bar_1)
#>                                    lugar   dia hora concurrencia   latitud
#> 1 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    6            0 -54.80635
#> 2 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    7            0 -54.80635
#> 3 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    8            0 -54.80635
#> 4 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    9            0 -54.80635
#> 5 Kuar 1900 Bar, San Martín 471, Ushuaia lunes   10            0 -54.80635
#> 6 Kuar 1900 Bar, San Martín 471, Ushuaia lunes   11            0 -54.80635
#>    longitud fecha.de.busqueda
#> 1 -68.30474        2021-01-26
#> 2 -68.30474        2021-01-26
#> 3 -68.30474        2021-01-26
#> 4 -68.30474        2021-01-26
#> 5 -68.30474        2021-01-26
#> 6 -68.30474        2021-01-26
```

Although, some other Google searches doesn’t have the wanted
information. In that case, NULL is returned:

``` r
bar_2 <- sgat("Moustacchio, San Martín 298, Ushuaia")
```

``` r
bar_2
#> NULL
```

The searches are not restricted to Ushuaia, but remember to be specific
in your searches, specially if the location you are lookinn for is far
away:

``` r
bar_3 <- sgat("coutume, 47 rue de babylone, 75007 paris, france")
```

``` r
head(bar_3)
#>                                              lugar   dia hora concurrencia
#> 1 coutume, 47 rue de babylone, 75007 paris, france lunes    6         0.00
#> 2 coutume, 47 rue de babylone, 75007 paris, france lunes    7         0.00
#> 3 coutume, 47 rue de babylone, 75007 paris, france lunes    8        13.50
#> 4 coutume, 47 rue de babylone, 75007 paris, france lunes    9        29.25
#> 5 coutume, 47 rue de babylone, 75007 paris, france lunes   10        34.50
#> 6 coutume, 47 rue de babylone, 75007 paris, france lunes   11        32.25
#>    latitud longitud fecha.de.busqueda
#> 1 48.85166 2.318299        2021-01-26
#> 2 48.85166 2.318299        2021-01-26
#> 3 48.85166 2.318299        2021-01-26
#> 4 48.85166 2.318299        2021-01-26
#> 5 48.85166 2.318299        2021-01-26
#> 6 48.85166 2.318299        2021-01-26
```
