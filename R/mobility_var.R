#' Download mobility variation data from one or many countries
#'
#' @param country.code Country code, vector of countries codes or "All". Countries codes can be found in "countries.codes". If "All", data from all countries will be downloaded
#'
#' @return Data frame with information of the mobility variations grouped by country, sub-region, date and type of activity
#' @export
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
mobility_var <- function(country.code){
  if (missing(country.code)) {
    stop('"country.code" must be specified')
  }
  if (sum(!(country.code %in% countries_codes$country.code)) > 0) {
    stop('"country.code" must be a valid country code, a vector of valid country codes or "All"')
  }
  URL <- "https://www.gstatic.com/covid19/mobility/Region_Mobility_Report_CSVs.zip"
  temp <- tempfile()
  utils::download.file(URL,temp)
  if(length(country.code > 1)){
    data <- data.frame()
    for (i in country.code){
      one.country <- utils::read.csv(unz(temp, paste("2020_", i,"_Region_Mobility_Report.csv", sep = "")), encoding = "UTF-8")
      data <- rbind(data, one.country)
    }
  }else if(country.code == "All"){
    nombres <- utils::unzip(temp, list = TRUE)$Name
    data <- data.frame()
    for (i in nombres){
      one.country <- utils::read.csv(unz(temp, i), encoding = "UTF-8")
      data <- rbind(data, one.country)
    }
  } else {
    data <- utils::read.csv(unz(temp, paste("2020_", country.code,"_Region_Mobility_Report.csv", sep = "")), encoding = "UTF-8")
  }
  unlink(temp)
  data[is.na(data$country_region_code), "country_region_code"] <- "NA"
  data
}
