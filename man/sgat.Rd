% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sgat.R
\name{sgat}
\alias{sgat}
\title{Iteration over \code{\link{sgat_day}} on every day of the week and finally save the retrieved data as a csv file. If you are looking for the "Popular Times" information for a single weekday use \code{\link{sgat_day}} instead.}
\usage{
sgat(lugar.a.buscar, tiempo.espera = 10, carpeta.guardado = NULL)
}
\arguments{
\item{lugar.a.buscar}{What you want to search in Google}

\item{tiempo.espera}{Time measure of how much time you think it's sufficient given your internet connection to load a Google search page and not finding the information,}

\item{carpeta.guardado}{Name of the directory where the csv files will be saved. If the directory doesn't exist, it will be created automatically.}
}
\value{
Data frame with retrieved information for all weekdays
}
\description{
Iteration over \code{\link{sgat_day}} on every day of the week and finally save the retrieved data as a csv file. If you are looking for the "Popular Times" information for a single weekday use \code{\link{sgat_day}} instead.
}
\examples{
\dontrun{
museo <- sgat(lugar.a.buscar = "museo nacional de bellas artes, buenos aires, argentina")
head(museo)
}
}
