#' Create map
#'
#' This function creates a ggplot2 map object of UK distribution or range, 
#' mapped on white background with grey35 (#595959) coastline. UK countries 
#' differentiated from non_UK countries using grey90 fill (#E5E5E5)
#' 
#' Distibution square polygons have a yellow (#E7E501) fill and range polygons 
#' a light blue (#72DFFE) fill, both with a black outline (#000000)
#'
#' @param layer simple features dataframe, contains spatial feature polygons
#' @param polygon_fill_colour character, hexadecimal code of polygon fill colour
#' @param base_uk simple feature dataframe, UK polygon coastline
#' @param base_nuk simple feature dataframe, non UK polygon coastline
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
stx_create_map <- function(layer, polygon_fill_colour, base_uk, base_nuk) {
  
  # blank map
  map <- ggplot2::ggplot() +
    ggthemes::theme_map() +
    ggplot2::theme(panel.grid.major = element_line(color = NA)) +
    ggplot2::geom_sf(data = base_nuk, fill = NA, colour = "#595959") +
    ggplot2::geom_sf(data = base_uk, fill = polygon_fill_colour, colour = "#595959")
  
  # add tenkm gridsquares
  map <- map +
    ggplot2::geom_sf(data = layer, fill = "#E7E501", colour = "#000000")
}

#' Britain and Ireland Oil and Gas Authority's coastline 
#' 
#' A simple features data frame of the British and Irish coastline 
#' derived from the Oil and Gas Authority's OGA and Lloyd's Register 
#' SNS Regional Geological Maps (Open Source) layer. 
#' Licence: Open Government Licence v3 (OGL) 
#' (http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
#' Attribution: Contains data © 2017 Oil & Gas Authority.
#' 
#' @format A shape file with 6 rows and 2 variables
#' \describe{
#'   \item{Country}{multipolygon country name}
#'   \item{UK}{multipolygon present in the UK or not (TRUE/FALSE)}
#' }
"base_map"

#' Britain and Ireland TenKM grids in British National Grid
#' 
#' A simple features data frame of the British and Irish 10KM 
#' grid squares in British National Grid projection (EPSG::27700)
#' 
#' @format A shape file with 11100 rows and 1 variables
#' \describe{
#'   \item{tenkm}{polygon 10KM BNG grid square label}
#' }
"base_grid_bng"

#' TenKM grids in ETRS89 covering Britain and Ireland
#' 
#' A simple features data frame of 10KM grid squares covering 
#' Britain and Ireland in ETRS89 projection (EPSG::3035)
#' 
#' @format A shape file with 28900 rows and 1 variables
#' \describe{
#'   \item{cell_code}{polygon 10KM ETRS grid square label}
#' }
"base_grid_etrs"

#' Britain and Ireland look up TenKM grids in ETRS89
#' 
#' A simple features data frame of the British and Irish 10KM 
#' grid squares in ETRS89 projection (EPSG::3035), matching 10KM 
#' BNG grid squares to their corresponding ETRS 10KM grid square 
#' based on largest area of overlap.
#' 
#' @format A shape file with 11100 rows and 2 variables
#' \describe{
#'   \item{cell_code}{polygon 10KM ETRS grid square label}
#'   \item{tenkm}{polygon 10KM BNG grid square label}
#' }
"base_grid_bng_etrs_lookup"