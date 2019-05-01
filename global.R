#global.R
require(leaflet); require(colorspace); require(dplyr); library(RColorBrewer)

source("helper_functions.r")

# prepare_data.R

require(leaflet); require(colorspace); require(dplyr); library(RColorBrewer)
source("helper_functions.r")


# read the countries data
px_countries <- read.table("PX_Countries_May_2019_static.txt", sep  ="\t", header = T, stringsAsFactors = F)
# you can also get it directly from Google sheets
# you will need to enter an authorization code
# px_countries <- gs_title("PX_Countries") %>% gs_read() 

# read a coordinate file
coordinates <- read.table("countries_lat_long.txt", header = TRUE,strip.white = TRUE, stringsAsFactors = FALSE, sep = "\t" , quote = "")

# see how many countries are there 
unique(px_countries$Country)
unique(coordinates$Country)

# clean px.countries
px_countries <- clean.px.countries(px_countries)
# summarise 
px_countries <- as.data.frame(table(px_countries$Country))

# map Lattitude & Longitude info
map.Long <- data.frame(Country=coordinates$Country, Long= coordinates$Long) 
map.Lat <- data.frame(Country = coordinates$Country, Lat = coordinates$Lat)
px_countries$Long <- map.Long$Long[match(px_countries$Var1, map.Long$Country)]
px_countries$Lat <- map.Lat$Lat[match(px_countries$Var1, map.Lat$Country)]

# remove unmapped fields
px_countries <- px_countries[ complete.cases(px_countries), ]
