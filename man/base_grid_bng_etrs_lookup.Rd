% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapping.R
\docType{data}
\name{base_grid_bng_etrs_lookup}
\alias{base_grid_bng_etrs_lookup}
\title{Britain and Ireland look up TenKM grids in ETRS89}
\format{A shape file with 11100 rows and 2 variables
\describe{
  \item{cell_code}{polygon 10KM ETRS grid square label}
  \item{tenkm}{polygon 10KM BNG grid square label}
}}
\usage{
base_grid_bng_etrs_lookup
}
\description{
A simple features data frame of the British and Irish 10KM 
grid squares in ETRS89 projection (EPSG::3035), matching 10KM 
BNG grid squares to their corresponding ETRS 10KM grid square 
based on largest area of overlap.
}
\keyword{datasets}
