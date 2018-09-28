#' Format species code
#'
#' @param speciescode character, species code beginning with S
#'
#' UK species codes starts with the letter S to distinguish
#' them from habitat codes. European codes do not have this
#' initial letter and so this function removes the initial S
#'
#' @return character, species code without the initial S
#' @export
#'
#' @examples
#' format_species_code("S1234")
format_species_code <- function(speciescode) {
  stringr::str_replace(stringr::str_to_lower(speciescode), "^s", "")
}
