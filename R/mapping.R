#' Britain and Ireland Oil and Gas Authority's coastline 
#' 
#' A shape file of the British and Irish coastline derived 
#' from the Oil and Gas Authority's OGA and Lloyd's Register 
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
#' A shape file of the British and Irish 10KM grid squares
#' in British National Grid projection (EPSG::27700)
#' 
#' @format A shape file with 11100 rows and 1 variables
#' \describe{
#'   \item{tenkm}{polygon 10KM BNG grid square label}
#' }
"base_grid_bng"

#' Britain and Ireland look up TenKM grids in ETRS89
#' 
#' A shape file of the British and Irish 10KM grid squares
#' in ETRS89 projection (EPSG::3035), matching 10KM BNG grid
#' squares to their corresponding ETRS 10KM grid square base 
#' on largest area of overlap.
#' 
#' @format A shape file with 11100 rows and 2 variables
#' \describe{
#'   \item{cell_code}{polygon 10KM ETRS grid square label}
#'   \item{tenkm}{polygon 10KM BNG grid square label}
#' }
"base_grid_etrs"