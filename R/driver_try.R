#' Automated driver creation and geckodriver selection. Using \code{\link{initialization_sgat}} instead is recommended.
#'
#' @return Tries for driver connection
#' @export
#'
#' @examples
#' \dontrun{driver_try()}
#'
driver_try <- function() {
  driver <- try(RSelenium::rsDriver(browser = "firefox", geckover = "latest"), silent = T)
  if ("try-error" %in% class(driver)) {
    versiones <- binman::list_versions("geckodriver")[[1]]
    x <- 1
    while ("try-error" %in% class(driver)) {
      try(system("taskkill /im java.exe /f", intern = FALSE, ignore.stdout = FALSE), silent = T)
      ver <- versiones[length(versiones) - x]
      driver <- try(RSelenium::rsDriver(browser = "firefox", geckover = ver), silent = T)
      x <- x + 1
    }
  }

  driver$client$close()
  remDr <<- driver[["client"]]
  remDr <<- RSelenium::remoteDriver(
    remoteServerAddr = "localhost",
    port = 4567,
    browserName = "firefox"
  )
}
