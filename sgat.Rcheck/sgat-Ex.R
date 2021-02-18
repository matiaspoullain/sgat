pkgname <- "sgat"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "sgat-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('sgat')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("initialization_sgat")
### * initialization_sgat

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: initialization_sgat
### Title: Automated server creation
### Aliases: initialization_sgat

### ** Examples

## Not run: 
##D initialization_sgat()
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("initialization_sgat", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sgat")
### * sgat

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sgat
### Title: Iteration over 'sgat_day' on every day of the week and finally
###   save the retrieved data as a csv file. If you are looking for the
###   "Popular Times" information for a single weekday use 'sgat_day'
###   instead.
### Aliases: sgat

### ** Examples

## Not run: 
##D museo <- sgat(lugar.a.buscar = "museo nacional de bellas artes, buenos aires, argentina")
##D head(museo)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sgat", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("sgat_day")
### * sgat_day

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: sgat_day
### Title: Opens firefox, searches in Google lugar.a.buscar place on the
###   dia.semana weekday. Then it retrieves the "Popular Times" and
###   geolocation information. If the search finds said information, the
###   function returns a data.frame, if not, NULL. If you are looking the
###   "Popular Times" information for the whole week use 'sgat' instead.
### Aliases: sgat_day

### ** Examples

## Not run: 
##D museo.miercoles <- sgat_day("museo nacional de bellas artes, buenos aires, argentina", "miercoles")
##D head(museo.miercoles)
## End(Not run)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("sgat_day", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("tripadvisor_places")
### * tripadvisor_places

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: tripadvisor_places
### Title: Search for the n most popular places in a city according to
###   Tripadvisor
### Aliases: tripadvisor_places

### ** Examples


## Not run: 
##D tripadvisor_places("Pinamar, Argentina", 10)
## End(Not run)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("tripadvisor_places", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ushuaia_restaurants")
### * ushuaia_restaurants

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ushuaia_restaurants
### Title: Retrieves a vector of Ushuaian's restaurants and bar's names and
###   adresses, ready for unambiguous Google searches.
### Aliases: ushuaia_restaurants

### ** Examples

restaurants <- ushuaia_restaurants()
head(restaurants)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ushuaia_restaurants", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
