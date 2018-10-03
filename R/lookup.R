#' Taxonomic name changes
#' 
#' A dataset containing the currently accepted
#' scientific name and the old synonymous name used
#' in previous Article 17 reporting rounds
#' 
#' @format A list with 1 row and 2 variables
#' \describe{
#'   \item{name_old}{scientific name used in previous reporting rounds}
#'   \item{name_new}{scientitic name used in the latest 2019 reporting round}
#' }
"name_look_up"

#' Code changes
#' 
#' A dataset containing the currently accepted species 
#' or habitat code and the old species or habitat code 
#' used in previous Article 17 reporting rounds
#' 
#' @format A list with 1 row and 2 variables
#' \describe{
#'   \item{code_old}{species or habitat code used in previous reporting rounds}
#'   \item{code_new}{species or habitat code  used in the latest 2019 reporting round}
#' }
"code_look_up"


#' Species audit notes categories
#' 
#' A dataset containing the Article 17 species audit notes categories
#' 
#' @format A tibble with 80 rows and 3 variables
#' \describe{
#'   \item{reporting_code}{species category's reporting code}
#'   \item{field_label}{species category's descriptive names, including reporting code}
#'   \item{entity_table_name}{reporting tool table name that contains column for the species category}
#' }
"notes_species_look_up"

#' Habitat audit notes categories
#' 
#' A dataset containing the Article 17 habitat audit notes categories
#' 
#' @format A tibble with 68 rows and 3 variables
#' \describe{
#'   \item{reporting_code}{habitat category's reporting code}
#'   \item{field_label}{habitat category's descriptive names, including reporting code}
#'   \item{entity_table_name}{reporting tool table name that contains column for the habitat category}
#' }
"notes_habitat_look_up"

#' Species information
#' 
#' A dataset containing the Article 17 species information
#' 
#' @format A tibble with 76 rows and 10 variables
#' \describe{
#'   \item{code}{species code starting with initial S}
#'   \item{name}{scientific name}
#'   \item{common_name}{common name}
#'   \item{taxon_group}{taxonomic group}
#'   \item{occurrence}{is the species resident within the UK}
#'   \item{annex ii}{is the species on EC Habitat Directive's Annex II list}
#'   \item{annex iv}{is the species on EC Habitat Directive's Annex IV list}
#'   \item{annex v}{is the species on EC Habitat Directive's Annex V list}
#'   \item{alpha}{alpha values used when creating range alpha shape polygons}
#'   \item{clipping_polygon}{are the alpha shape range polygons clipped to the UK coast}
#' }
"information_species_look_up"

#' Habitat information
#' 
#' A dataset containing the Article 17 habitat information
#' 
#' @format A tibble with 69 rows and 5 variables
#' \describe{
#'   \item{code}{habitat code starting with initial H}
#'   \item{name}{habitat name}
#'   \item{group}{habitat group}
#'   \item{alpha}{alpha values used when creating range alpha shape polygons}
#'   \item{clipping_polygon}{are the alpha shape range polygons clipped to the UK coast}
#' }
"information_habitat_look_up"

