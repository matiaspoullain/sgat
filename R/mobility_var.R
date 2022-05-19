#' Download mobility variation data from one or many countries
#'
#' @param country.code Character class country code, vector of countries codes or "All". Countries codes can be found in "countries.codes". If "All", data from all countries will be downloaded
#' @param year Numeric vector of years of interest. Only available options: 2020, 2021 and 2022. Default: 2020:2022
#'
#' @return Data frame with information of the mobility variations grouped by country, sub-region, date and type of activity
#' @export
#' @import data.table
#'
#' @examples
#'\dontrun{
  #' argentina <- mobility_var("AR")
  #' head(argentina)
  #'
  #' northAmerica <- mobility_var(c("CA", "US", "MX"))
  #' head(northAmerica)
  #'
  #' allCountries <- mobility_var("All")
  #' head(allCountries)
  #' }
mobility_var <- function(country.code, year = 2020:2022){
  if (missing(country.code)) {
    stop('"country.code" must be specified')
  }
  if (min(year) < 2020 | max(year) > 2022 | !is.numeric(year)) {
    stop('"year" must be a numeric vector whose values are between 2020 and 2022')
  }
  if (sum(!(country.code %in% countries_codes$country.code)) > 0) {
    stop('"country.code" must be a valid country code, a vector of valid countries codes or "All"')
  }
  URL <- "https://www.gstatic.com/covid19/mobility/Region_Mobility_Report_CSVs.zip"
  temp <- tempfile()
  utils::download.file(URL,temp)
  if(length(country.code) > 1){
    data <- data.table::data.table()
    for (i in country.code){
      for(j in year){
        cat("\rProcessing country #", which(i == country.code), "of", length(country.code))
        one.country <- utils::read.csv(unz(temp, paste(j, "_", i,"_Region_Mobility_Report.csv", sep = "")), encoding = "UTF-8")
        data <- rbind(data, one.country)
      }
    }
  }else if(country.code == "All"){
    nombres <- utils::unzip(temp, list = TRUE)$Name
    nombres <- nombres[grepl(paste(year, collapse = "|"), nombres)]
    data <- data.table::data.table()
    for (i in nombres){
      cat("\rProcessing country #", which(i == nombres), "of", length(nombres))
      one.country <- utils::read.csv(unz(temp, i), encoding = "UTF-8")
      data <- rbind(data, one.country)
    }
  } else {
    for(j in year){
      one.year <- utils::read.csv(unz(temp, paste(j, country.code,"Region_Mobility_Report.csv", sep = "_")), encoding = "UTF-8")%>%
        data.table::as.data.table()
      data <- rbind(data, one.year)
    }
  }
  unlink(temp)
  data[is.na(country_region_code), "country_region_code"] <- "NA"
  data
}
