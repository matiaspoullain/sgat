
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
#> [1] 25108
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilejyoIso"
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
#> [1] "f7c79a94-6322-4804-b8f7-125459564c76"
#> 
#> $id
#> [1] "f7c79a94-6322-4804-b8f7-125459564c76"
```

This package was created to use it on restaurants, bars, etc… located in
Ushuaia city, Tierra del Fuego, Argentina. You can retrieve a vector of
them by using the next code:

``` r
restaurants <- ushuaia_restaurants()
head(restaurants)
#> [1] "Kuar 1900 Bar, San Martín 471, Ushuaia"            
#> [2] "Prana, Av Maipu 505, Ushuaia"                      
#> [3] "La Cabaña Casa de Té, Luis F Martial 3560, Ushuaia"
#> [4] "Kuar, Av Perito Moreno 2232, Ushuaia"              
#> [5] "Hostal del Bosque, Magallanes 709, Ushuaia"        
#> [6] "La Cabaña, Luis Fernando Martial 3550, Ushuaia"
```

You can retrieve the information from some of these restaurants. A csv
file will be created in the “CSVs Concurrencias” directory by default.
The file’s name is the string you looked for.

``` r
bar_1 <- sgat("Kuar 1900 Bar, San Martín 471, Ushuaia", carpeta.guardado = "CSVs Concurrencias")
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
#> [1] 14476
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileQ3ctV8"
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
#> [1] "31a072d5-80f5-4928-a384-c107fa521890"
#> 
#> $id
#> [1] "31a072d5-80f5-4928-a384-c107fa521890"
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
#> [1] 14348
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofile4wLDiN"
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
#> [1] "c7a48936-6f27-4f51-a2e4-653d06d70eb8"
#> 
#> $id
#> [1] "c7a48936-6f27-4f51-a2e4-653d06d70eb8"
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
#> [1] 15044
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileiVyTAV"
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
#> [1] "cc23e584-4e00-4510-9126-adea8e3c5a12"
#> 
#> $id
#> [1] "cc23e584-4e00-4510-9126-adea8e3c5a12"
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
#> [1] 17264
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofile2godh2"
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
#> [1] "8cae7d4a-b36d-4ea0-bf88-be408d98506e"
#> 
#> $id
#> [1] "8cae7d4a-b36d-4ea0-bf88-be408d98506e"
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
#> [1] 29896
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileFWON9b"
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
#> [1] "bd98ae79-d0a5-40fc-8254-1a180052edd6"
#> 
#> $id
#> [1] "bd98ae79-d0a5-40fc-8254-1a180052edd6"
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
#> [1] 8236
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilep9dnRG"
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
#> [1] "3d6e7de3-493d-403b-b7fd-decab1c764c2"
#> 
#> $id
#> [1] "3d6e7de3-493d-403b-b7fd-decab1c764c2"
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
#> [1] 21720
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilePUls85"
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
#> [1] "b0a5ca63-9873-4388-9879-c9ff57773c2e"
#> 
#> $id
#> [1] "b0a5ca63-9873-4388-9879-c9ff57773c2e"
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
#> 1 -68.30474        2021-01-25
#> 2 -68.30474        2021-01-25
#> 3 -68.30474        2021-01-25
#> 4 -68.30474        2021-01-25
#> 5 -68.30474        2021-01-25
#> 6 -68.30474        2021-01-25
```

Although, some other Google searches doesn’t have the wanted
information. In that case, NULL is returned:

``` r
bar_2 <- sgat("Moustacchio, San Martín 298, Ushuaia")
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
#> [1] 15880
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileGOZDYf"
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
#> [1] "f74e930d-8540-4411-96fb-2a35ee71d046"
#> 
#> $id
#> [1] "f74e930d-8540-4411-96fb-2a35ee71d046"
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
#> [1] 8032
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofiletPZWV8"
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
#> [1] "b05eec44-dec2-4c15-8b8c-452b7ef97fbb"
#> 
#> $id
#> [1] "b05eec44-dec2-4c15-8b8c-452b7ef97fbb"
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
#> [1] 17352
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileAtENrk"
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
#> [1] "5d960b2b-18d9-437b-bb4e-94eb1106b94e"
#> 
#> $id
#> [1] "5d960b2b-18d9-437b-bb4e-94eb1106b94e"
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
#> [1] 29868
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileZ06D7f"
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
#> [1] "8eab5c68-99a6-4f04-b843-e2209827c7ee"
#> 
#> $id
#> [1] "8eab5c68-99a6-4f04-b843-e2209827c7ee"
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
#> [1] 17888
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileeFvPwi"
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
#> [1] "7ca60953-dc14-46c9-9774-5da281c5e504"
#> 
#> $id
#> [1] "7ca60953-dc14-46c9-9774-5da281c5e504"
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
#> [1] 16032
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileZw2nlZ"
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
#> [1] "506f3923-6ecb-4ae7-b3ad-c27b3a5119ad"
#> 
#> $id
#> [1] "506f3923-6ecb-4ae7-b3ad-c27b3a5119ad"
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
#> [1] 1208
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofiledx74rQ"
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
#> [1] "d346b0fb-1c70-484b-9810-62801e148175"
#> 
#> $id
#> [1] "d346b0fb-1c70-484b-9810-62801e148175"
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
#> [1] 28628
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileF3mvHX"
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
#> [1] "42846d69-77d3-4f0e-959f-a48e12b487d1"
#> 
#> $id
#> [1] "42846d69-77d3-4f0e-959f-a48e12b487d1"
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
#> 1 48.85166 2.318299        2021-01-25
#> 2 48.85166 2.318299        2021-01-25
#> 3 48.85166 2.318299        2021-01-25
#> 4 48.85166 2.318299        2021-01-25
#> 5 48.85166 2.318299        2021-01-25
#> 6 48.85166 2.318299        2021-01-25
```
