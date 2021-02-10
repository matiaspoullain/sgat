#' Automated server creation
#'
#' @return "Driver connection"
#' @export
#'
#' @examples
#' \dontrun{initialization_sgat()}
initialization_sgat <- function() {
  driver <- RSelenium::rsDriver(browser = "firefox", geckover = "0.28.0")
  driver$client$close()
  remDr <<- driver[["client"]]
  remDr <<- RSelenium::remoteDriver(
    remoteServerAddr = "localhost",
    port = 4567,
    browserName = "firefox"
  )
}
