#' Iteration over sgat_day on every day of the week and finally save the retrieved data as a csv file
#'
#' @param lugar.a.buscar
#' @param tiempo.espera
#' @param carpeta.guardado
#'
#' @return dataframe with retrieved information for all weekdays
#' @export
#'
#' @examples
#' sgat(lugar.a.buscar = "museo nacional de bellas artes, buenos aires, argentina")
sgat <- function(lugar.a.buscar, tiempo.espera = 10, carpeta.guardado = "CSVs Concurrencias"){
  dias.semana <- c("martes", "miercoles", "jueves", "viernes", "sabado", "domingo")
  df <- sgat::sgat_day(lugar.a.buscar, "lunes", tiempo.espera)
  if(!is.data.frame(df)){
    if(length(df) == 0){
      i <- TRUE
    }else if(df == "Sin datos de concurrencia") {
      i <- FALSE
    }
  }else{
    i <- TRUE
  }
  for(dia.semana in dias.semana){
    if(i){
      datos <- sgat::sgat_day(lugar.a.buscar, dia.semana, tiempo.espera)
      df <- rbind(df, datos)
    }
  }
  if(i){
    dir.create(carpeta.guardado, showWarnings = FALSE) #crea la carpeta concurrencia si no existe aun
    utils::write.csv(df, file = paste(carpeta.guardado, "/Concurrencia ", lugar.a.buscar, " ", as.character(Sys.Date()),".csv", sep = ""))
  }
  df
}
