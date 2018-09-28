#' Reverse yes and no
#'
#' This function reverses yes and no as species categories 5.11, 6.16 
#' and 11.7 in data capture spreadsheet ask for change (yes or no) where 
#' as in reporting tool the same categories ask for no change (yes or no)
#'
#' @param yes_no character, yes or no
#'
#' @return character, yes and no are swopped around
#' @export
#'
#' @examples
#' reverse_yes_no("yes")
reverse_yes_no <- function(yes_no) {
  
  tibble::as.tibble(yes_no) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) == "no" ~ "Yes",
             stringr::str_to_lower(value) == "yes" ~ "No",
             TRUE ~ value
           )) %>% 
    unlist()
  
}

#' Recode methods used
#'
#' This function changes the descriptive methods used text to
#' the abbreviated text used in the reporting tool
#'
#' @param methods_used character, method used text
#'
#' @return character, methods used abbreviated text
#' @export
#'
#' @examples
#' recode_methods_used("Based mainly on expert opinion with very limited data")
recode_methods_used <- function(methods_used) {
  
  tibble::as.tibble(methods_used) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "complete survey") ~ "completeSurvey",
             stringr::str_detect(stringr::str_to_lower(value), "extrapolation") ~ "estimatePartial",
             stringr::str_detect(stringr::str_to_lower(value), "expert opinion") ~ "estimateExpert",
             stringr::str_detect(stringr::str_to_lower(value), "insufficient or no data") ~ "absentData",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode population units
#' 
#' This function changes the descriptive population units text to
#' the abbreviated text used in the reporting tool 
#'
#' @param population_unit character, population unit text
#'
#' @return character, population unit abbreviated text
#' @export
#'
#' @examples
#' recode_population_units("number of adults")
recode_population_units <- function(population_unit) {
  
  tibble::as.tibble(population_unit) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) ==  "number of adults"  ~  "adults",
             stringr::str_to_lower(value) ==  "area coverd by population in m2"  ~  "area",
             stringr::str_to_lower(value) ==  "number of breeding females"  ~  "bfemales",
             stringr::str_to_lower(value) ==  "number of calling males"  ~  "cmales",
             stringr::str_to_lower(value) ==  "number of colonies"  ~  "colonies",
             stringr::str_to_lower(value) ==  "number of flowering stems"  ~  "fstems",
             stringr::str_to_lower(value) ==  "number of map 10x10 km grid cells"  ~  "grids10x10",
             stringr::str_to_lower(value) ==  "number of map 1x1 km grid cells"  ~  "grids1x1",
             stringr::str_to_lower(value) ==  "number of map 5x5 km grid cells"  ~  "grids5x5",
             stringr::str_to_lower(value) ==  "number of individuals"  ~  "i",
             stringr::str_to_lower(value) ==  "length of inhabited feature in km"  ~  "length",
             stringr::str_to_lower(value) ==  "number of localities"  ~  "localities",
             stringr::str_to_lower(value) ==  "number of inhabited logs"  ~  "logs",
             stringr::str_to_lower(value) ==  "number of males"  ~  "males",
             stringr::str_to_lower(value) ==  "number of pairs"  ~  "p",
             stringr::str_to_lower(value) ==  "number of shoots"  ~  "shoots",
             stringr::str_to_lower(value) ==  "number of inhabited stones/boulders"  ~  "stones",
             stringr::str_to_lower(value) ==  "number of subadults"  ~  "subadults",
             stringr::str_to_lower(value) ==  "number of inhabited trees"  ~  "trees",
             stringr::str_to_lower(value) ==  "number of tufts"  ~  "tufts",
             TRUE ~ value
           )) %>% 
    unlist()
}


