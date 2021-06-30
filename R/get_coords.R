#' Get coordinates from a place's name from Google
#'
#' @param lugares.a.buscar What you want to search in Google. Single input or a character vector
#' @param tiempo.espera ime measure of how much time you think it's sufficient given your internet connection to load a Google search page and not finding the information,
#'
#' @return dataframe containing the name and the coordinates
#' @export
#'
#' @examples
#' \dontrun{
#' museo <- get_coords("museo nacional de bellas artes, buenos aires, argentina")
#' museo
#' }
get_coords <- function(lugares.a.buscar, tiempo.espera = 10) {
  if (missing(lugares.a.buscar)) {
    stop('"lugares.a.buscar" must be specified')
  }
  df.todos <- data.frame()
  for(i in lugares.a.buscar){
    remDr$open(silent = TRUE) # abre firefox
    remDr$navigate("https://www.google.com.ar") # va a google.com.ar
    webElem <- remDr$findElement(using = "name", value = "q") # selecciona el recuadro de busqueda
    webElem$sendKeysToElement(list(i, "\uE007")) # escribe el i y hace la busqueda
    Sys.sleep(2)

    coordenadas <- NA_character_ # para empezar el loop que sigue
    x <- 0
    while (x <= tiempo.espera & is.na(coordenadas)) {
      source <- remDr$getPageSource()[[1]] # codigo de fuente de la pagina de google
      coordenadas <- qdapRegex::ex_between(source, 'data-url="/maps/place/', ",15z")
      x <- x + 1
    }
    remDr$close() # cierra firefox, ya no se necesita
    if (is.na(coordenadas)) {
      latitud <- NA_character_
      longitud <- NA_character_
    }else{
      coordenadas <- sub(".*@", "", coordenadas)
      latitud <- sub(",.*", "", coordenadas)
      longitud <- sub(".*,", "", coordenadas)
    }
    df <- data.frame(latitud, longitud)
    df$lugar <- i
    df.todos <- rbind(df.todos, df)
  }
  df.todos
}
