#' Iterates over \code{\link{driver_try}} until the driver is created
#'
#' @return "Driver connection"
#' @export
#'
#' @examples
#' \dontrun{initialization_sgat()}
initialization_sgat <- function() {
  intento <- c("1")
  class(intento) <- "try-error"
  while ("try-error" %in% class(intento)) {
    intento <- try(sgat::driver_try(), silent = T)
  }
}
