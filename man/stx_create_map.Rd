% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapping.R
\name{stx_create_map}
\alias{stx_create_map}
\title{Create map}
\usage{
stx_create_map(layer, polygon_fill_colour, base_uk, base_nuk)
}
\arguments{
\item{layer}{simple features dataframe, contains spatial feature polygons}

\item{polygon_fill_colour}{character, hexadecimal code of polygon fill colour}

\item{base_uk}{simple feature dataframe, UK polygon coastline}

\item{base_nuk}{simple feature dataframe, non UK polygon coastline}
}
\value{
ggplot2 object
}
\description{
This function creates a ggplot2 map object of UK distribution or range, 
mapped on white background with grey35 (#595959) coastline. UK countries 
differentiated from non_UK countries using grey90 fill (#E5E5E5)
}
\details{
Distibution square polygons have a yellow (#E7E501) fill and range polygons 
a light blue (#72DFFE) fill, both with a black outline (#000000)
}
