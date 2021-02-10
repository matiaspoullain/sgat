#' Automated server creation
#'
#' @return "Driver connection"
#' @export
#'
#' @examples
#' \dontrun{initialization_sgat()}
initialization_sgat <- function(geckover = "latest", ...) {
  driver <- RSelenium::rsDriver(browser = "firefox", geckover = geckover)
  driver$client$close()
  remDr <<- driver[["client"]]
  remDr <<- RSelenium::remoteDriver(
    remoteServerAddr = "localhost",
    port = 4567,
    browserName = "firefox"
  )
}
