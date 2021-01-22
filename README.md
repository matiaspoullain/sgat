
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
#> [1] 9568
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofile9vfqlI"
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
#> [1] "601750a1-cd65-4ea3-8f02-43a921cf6793"
#> 
#> $id
#> [1] "601750a1-cd65-4ea3-8f02-43a921cf6793"
```

This package was created to use it on restaurants, bars, etc… located in
Ushuaia city, Tierra del Fuego, Argentina. You can retrieve a vector
them with the next code:

``` r
restaurants <- ushuaia_restaurants()
head(restaurants)
#> [1] "Moustacchio, San Martín 298, Ushuaia"              
#> [2] "Prana, Av Maipu 505, Ushuaia"                      
#> [3] "Kuar, Av Perito Moreno 2232, Ushuaia"              
#> [4] "La Cabaña Casa de Té, Luis F Martial 3560, Ushuaia"
#> [5] "Hostal del Bosque, Magallanes 709, Ushuaia"        
#> [6] "Kuar 1900, San Martín 471, Ushuaia"
```

You can retrieve the information from some of these restaurants. A csv
file will be created in the “CSVs Concurrencias” directory by default.
The file’s name is the string you looked for.

``` r
bar_1 <- sgat(restaurants[1], carpeta.guardado = "CSVs Concurrencias")
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
#> [1] 22688
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileLuhLy0"
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
#> [1] "2ce3df4a-2c9f-4ef5-b7d1-a89051a41ee1"
#> 
#> $id
#> [1] "2ce3df4a-2c9f-4ef5-b7d1-a89051a41ee1"
head(bar_1)
#> [1] "Sin datos de concurrencia"
```

Although, some other Google searches doesn’t have the wanted
information. In that case, NULL is returned:

``` r
bar_2 <- sgat(restaurants[2])
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
#> [1] 17680
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileiK4DSL"
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
#> [1] "5cad93e7-ecfd-4dc2-846e-0b5828ae4a6e"
#> 
#> $id
#> [1] "5cad93e7-ecfd-4dc2-846e-0b5828ae4a6e"
bar_2
#> [1] "Sin datos de concurrencia"
```

The searches are not restricted to Ushuaia, but remember to be specific
in your searches, specially if the location you are lookinn for is far
away:

``` r
bar_3 <- sgat("coutume, 47 rue de babylone, 75007 paris, france")
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
#> [1] 27036
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilexXRTSQ"
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
#> [1] "1e748e7a-d37e-4920-afdc-d3d4609bff96"
#> 
#> $id
#> [1] "1e748e7a-d37e-4920-afdc-d3d4609bff96"
#> 
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
#> [1] 12544
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilekGrLV2"
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
#> [1] "8b26e28e-099f-435e-93e8-6a6a610e2b9a"
#> 
#> $id
#> [1] "8b26e28e-099f-435e-93e8-6a6a610e2b9a"
#> 
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
#> [1] 22460
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileBI5vAk"
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
#> [1] "10f44b8a-2274-4fd8-a2e9-b7ee9301543c"
#> 
#> $id
#> [1] "10f44b8a-2274-4fd8-a2e9-b7ee9301543c"
#> 
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
#> [1] 10312
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileizHVRW"
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
#> [1] "4ec4b84d-738f-40ee-9495-f0a8f3e4ed67"
#> 
#> $id
#> [1] "4ec4b84d-738f-40ee-9495-f0a8f3e4ed67"
#> 
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
#> [1] 19356
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilelVpdgV"
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
#> [1] "1f57f6aa-d21e-4a3a-be43-66be77814823"
#> 
#> $id
#> [1] "1f57f6aa-d21e-4a3a-be43-66be77814823"
#> 
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
#> [1] 20988
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilepfdJYR"
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
#> [1] "0c658f55-4260-4520-8d21-026211712116"
#> 
#> $id
#> [1] "0c658f55-4260-4520-8d21-026211712116"
#> 
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
#> [1] 13176
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileeHGUpy"
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
#> [1] "3ec78330-c3f9-41e7-8dbe-ccf8022cd1da"
#> 
#> $id
#> [1] "3ec78330-c3f9-41e7-8dbe-ccf8022cd1da"
head(bar_3)
#>                                              lugar   dia hora concurrencia
#> 1 coutume, 47 rue de babylone, 75007 paris, france lunes    6         0.00
#> 2 coutume, 47 rue de babylone, 75007 paris, france lunes    7         0.00
#> 3 coutume, 47 rue de babylone, 75007 paris, france lunes    8        13.50
#> 4 coutume, 47 rue de babylone, 75007 paris, france lunes    9        29.25
#> 5 coutume, 47 rue de babylone, 75007 paris, france lunes   10        34.50
#> 6 coutume, 47 rue de babylone, 75007 paris, france lunes   11        32.25
#>    latitud longitud fecha.de.busqueda
#> 1 48.85166 2.318299        2021-01-22
#> 2 48.85166 2.318299        2021-01-22
#> 3 48.85166 2.318299        2021-01-22
#> 4 48.85166 2.318299        2021-01-22
#> 5 48.85166 2.318299        2021-01-22
#> 6 48.85166 2.318299        2021-01-22
```
