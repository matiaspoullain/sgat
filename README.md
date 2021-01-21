
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
#> checking Selenium Server versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking chromedriver versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking geckodriver versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking phantomjs versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking Selenium Server versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking chromedriver versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking geckodriver versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
#> checking phantomjs versions:
#> BEGIN: PREDOWNLOAD
#> BEGIN: DOWNLOAD
#> BEGIN: POSTDOWNLOAD
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
#> [1] 22820
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilevAceA3"
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
#> [1] "1b56ada9-53eb-4578-8ac9-4b675ca87df7"
#> 
#> $id
#> [1] "1b56ada9-53eb-4578-8ac9-4b675ca87df7"
```

This package was created to use it on restaurants, bars, etc… located in
Ushuaia city, Tierra del Fuego, Argentina. You can retrieve a vector
them with the next code:

``` r
restaurants <- ushuaia_restaurants()
head(restaurants)
#> [1] "Kuar 1900 Bar, San Martín 471, Ushuaia"            
#> [2] "Moustacchio, San Martín 298, Ushuaia"              
#> [3] "Kuar, Av Perito Moreno 2232, Ushuaia"              
#> [4] "La Cabaña Casa de Té, Luis F Martial 3560, Ushuaia"
#> [5] "La Cabaña, Luis Fernando Martial 3550, Ushuaia"    
#> [6] "Hostal del Bosque, Magallanes 709, Ushuaia"
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
#> [1] 11644
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileRQRVey"
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
#> [1] "942b693b-94cb-436b-a1a9-9c306fead6d5"
#> 
#> $id
#> [1] "942b693b-94cb-436b-a1a9-9c306fead6d5"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
#> Warning in if (!is.na(concurrencia)) {: la condición tiene longitud > 1 y sólo
#> el primer elemento será usado
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
#> [1] 21052
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileRKkaqN"
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
#> [1] "9653c7a3-0dfb-4915-bcc4-8b8964c5d16b"
#> 
#> $id
#> [1] "9653c7a3-0dfb-4915-bcc4-8b8964c5d16b"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 15588
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileZ5qQoB"
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
#> [1] "fceea1f9-dfa5-4228-ab40-bc21a8d285e4"
#> 
#> $id
#> [1] "fceea1f9-dfa5-4228-ab40-bc21a8d285e4"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 2936
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileGjtA04"
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
#> [1] "30fc8e12-dd18-49fb-a5c2-060989be0843"
#> 
#> $id
#> [1] "30fc8e12-dd18-49fb-a5c2-060989be0843"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 26408
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileJx40LI"
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
#> [1] "d634bfd0-2c02-4619-8bcb-a5482ce02979"
#> 
#> $id
#> [1] "d634bfd0-2c02-4619-8bcb-a5482ce02979"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 8560
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileTYVGuW"
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
#> [1] "321308fc-510a-49f9-83ba-30ab04a15ffd"
#> 
#> $id
#> [1] "321308fc-510a-49f9-83ba-30ab04a15ffd"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 19008
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofilegE3Af1"
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
#> [1] "2a749fc5-c9cd-46bf-9ae2-7c5a97a1ce38"
#> 
#> $id
#> [1] "2a749fc5-c9cd-46bf-9ae2-7c5a97a1ce38"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
head(bar_1)
#>                                    lugar   dia hora concurrencia   latitud
#> 1 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    6            0 -54.80635
#> 2 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    7            0 -54.80635
#> 3 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    8            0 -54.80635
#> 4 Kuar 1900 Bar, San Martín 471, Ushuaia lunes    9            0 -54.80635
#> 5 Kuar 1900 Bar, San Martín 471, Ushuaia lunes   10            0 -54.80635
#> 6 Kuar 1900 Bar, San Martín 471, Ushuaia lunes   11            0 -54.80635
#>    longitud fecha.de.busqueda
#> 1 -68.30474        2021-01-21
#> 2 -68.30474        2021-01-21
#> 3 -68.30474        2021-01-21
#> 4 -68.30474        2021-01-21
#> 5 -68.30474        2021-01-21
#> 6 -68.30474        2021-01-21
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
#> [1] 25228
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileGIJUnD"
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
#> [1] "fb5a20ee-7490-4b21-8718-ec178bb039ca"
#> 
#> $id
#> [1] "fb5a20ee-7490-4b21-8718-ec178bb039ca"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 17440
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileflaOJ6"
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
#> [1] "6bbf4fa4-19b8-4e29-8f43-78a91a08dca8"
#> 
#> $id
#> [1] "6bbf4fa4-19b8-4e29-8f43-78a91a08dca8"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
#> Warning in if (!is.na(concurrencia)) {: la condición tiene longitud > 1 y sólo
#> el primer elemento será usado
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
#> [1] 19048
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileHBbaVo"
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
#> [1] "aa2b6d72-749e-4968-bca6-2a00a61edf2a"
#> 
#> $id
#> [1] "aa2b6d72-749e-4968-bca6-2a00a61edf2a"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 23560
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileK06Muw"
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
#> [1] "7a0dc360-4613-4d16-a43f-c985ff54a295"
#> 
#> $id
#> [1] "7a0dc360-4613-4d16-a43f-c985ff54a295"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 14296
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileFE4ahe"
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
#> [1] "e6ec753e-2c19-4bc9-b5e3-6f36cecbbbaa"
#> 
#> $id
#> [1] "e6ec753e-2c19-4bc9-b5e3-6f36cecbbbaa"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 28732
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileOYvmww"
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
#> [1] "ffc66b39-f79b-45f5-9dff-518eb0fc6d7a"
#> 
#> $id
#> [1] "ffc66b39-f79b-45f5-9dff-518eb0fc6d7a"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 29596
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileR2HAZc"
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
#> [1] "9b51032f-1b8c-499e-a7f6-da221de83885"
#> 
#> $id
#> [1] "9b51032f-1b8c-499e-a7f6-da221de83885"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
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
#> [1] 19808
#> 
#> $`moz:profile`
#> [1] "C:\\Users\\Matias\\AppData\\Local\\Temp\\rust_mozprofileRB4StZ"
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
#> [1] "1579128f-b939-49a5-9763-cc8530bdf833"
#> 
#> $id
#> [1] "1579128f-b939-49a5-9763-cc8530bdf833"
#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado

#> Warning in while (x <= tiempo.espera & replace(apertura, is.na(apertura), : la
#> condición tiene longitud > 1 y sólo el primer elemento será usado
head(bar_3)
#>                                              lugar   dia hora concurrencia
#> 1 coutume, 47 rue de babylone, 75007 paris, france lunes    6         0.00
#> 2 coutume, 47 rue de babylone, 75007 paris, france lunes    7         0.00
#> 3 coutume, 47 rue de babylone, 75007 paris, france lunes    8        13.50
#> 4 coutume, 47 rue de babylone, 75007 paris, france lunes    9        29.25
#> 5 coutume, 47 rue de babylone, 75007 paris, france lunes   10        34.50
#> 6 coutume, 47 rue de babylone, 75007 paris, france lunes   11        32.25
#>    latitud longitud fecha.de.busqueda
#> 1 48.85166 2.318299        2021-01-21
#> 2 48.85166 2.318299        2021-01-21
#> 3 48.85166 2.318299        2021-01-21
#> 4 48.85166 2.318299        2021-01-21
#> 5 48.85166 2.318299        2021-01-21
#> 6 48.85166 2.318299        2021-01-21
```
