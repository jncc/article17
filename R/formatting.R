#' Format species code
#' 
#' UK species codes starts with the letter S to distinguish
#' them from habitat codes. European codes do not have this
#' initial letter and so this function removes the initial S
#'
#' @param speciescode character, species code beginning with S
#'
#' @return character, species code without the initial S
#' @export
#'
#' @examples
#' format_species_code("S1234")
format_species_code <- function(speciescode) {
  stringr::str_replace(stringr::str_to_lower(speciescode), "^s", "")
}


#' Format habitat code
#' 
#' UK habitat codes starts with the letter H to distinguish
#' them from species codes. European codes do not have this
#' initial letter and so this function removes the initial H
#'
#' @param habitatcode character, habitat code beginning with H
#'
#' @return character, habitat code without the initial H
#' @export
#'
#' @examples
#' format_habitat_code("H1234")
format_habitat_code <- function(habitatcode) {
  stringr::str_replace(habitatcode, "^H", "")
}

#' Format country
#' 
#' This function removes any spaces within the countries name
#'
#' @param country character, country name
#'
#' @return character, country name without spaces
#' @export
#'
#' @examples
#' format_country("Northen Ireland")
format_country <- function(country) {
  stringr::str_replace_all(country, " ", "")
}

#' Format single year date
#'
#' This function formats dates consisting of a 4 digit year, adding
#' a dash at the end so that the reporting tool can handle these single
#' dates in a year range. It also replaces the unicode dash character 
#'
#' @param date integer or character, 4 digits
#'
#' @return character, 4 digits with end dash
#' @export
#'
#' @examples
#' format_date(2018)
format_date <- function(date) {
  
  tibble::as.tibble(date) %>% 
    dplyr::mutate(value = as.character(value)) %>% 
    dplyr::mutate(value = dplyr::if_else(stringr::str_detect(value, "^[0-9]{4}$"), stringr::str_c(value, "-"), value),
           value = stringr::str_replace_all(value, "–", "-")) %>% 
    unlist()
}

#' Format text
#'
#' This function formats free text handling NA characters, end of line
#' characters, double quotes, URL characters and converting unicode
#' characters to the most appropriate ASCII character
#'
#' @param text character, free text
#'
#' @return character, formatted free text
#' @export
#'
#' @examples
#' format_text("▪ #NAUnformatted%20text list starting with NA")
format_text <- function(text) {
  
  text_formatting <- tibble::as.tibble(text)
  
  # Handle NA as strings
  text_formatting <- text_formatting %>% 
    dplyr::mutate(value = stringr::str_replace_all(value, "#NA#", "#"),
           value = stringr::str_replace_all(value, "#NA", ""),
           value = stringr::str_replace_all(value, "^NA#", ""),
           value = dplyr::if_else(value == "NA", NA_character_, value))
  
  # Handle end of line characters
  text_formatting <- text_formatting %>% 
    dplyr::mutate(value = stringr::str_replace_all(value, "\r\n", "#"),
           value = stringr::str_replace_all(value, "#{2,}", "#"))
  
  # Handle double quotes
  text_formatting <- text_formatting %>%
    dplyr::mutate(value = stringr::str_replace_all(value, '"', ''))
  
  # Handle URL characters
  text_formatting <- text_formatting %>%
    dplyr::mutate(value = stringr::str_replace_all(value, '%20', ' '))
  
  # Handle unicode characters
  text_formatting <- text_formatting %>% 
    dplyr::mutate(value = stringi::stri_escape_unicode(value),
           value = stringr::str_replace_all(value, "\\\\u2022", "-"), # bullet point
           value = stringr::str_replace_all(value, "\\\\u25aa", "-"), # black small square
           value = stringr::str_replace_all(value, "\\\\u2013", "-"), # en-dash
           value = stringr::str_replace_all(value, "\\\\u2019", "'"), # opening apostrophe
           value = stringr::str_replace_all(value, "\\\\u2018", "'"), # closing apostrophe
           value = stringr::str_replace_all(value, "\\\\u00d4\\\\u00eb\\\\u00f1", "<=")) # less than or equal
  
  text_formatting <- unlist(text_formatting)
}
#(format_text('"This • is a bullet point \r\n This ▪ is a black small square \r\n This – is a en-dash \r\n This ’ is an opening apostrophe \r\n This ‘ is a closing apostrophe"'))


