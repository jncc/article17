#' Reverse yes and no
#'
#' This function reverses yes and no as species categories 5.11, 6.16 
#' and 11.7 in data capture spreadsheet ask for change (yes or no) where 
#' as in reporting tool the same categories ask for no change (yes or no)
#'
#' Blanks are converted to yes (no change) in the reporting tool as the
#' reporting tool only stores two states yes or no
#'
#' @param yes_no character, yes, no or NA_character_
#'
#' @return character, yes and no are swopped around, blank converted to yes
#' @export
#'
#' @examples
#' reverse_yes_no(c("Yes", "No", NA))
reverse_yes_no <- function(yes_no_blank) {
  
  tibble::as.tibble(yes_no_blank) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) == "no" ~ "Yes",
             is.na(value) ~ "Yes",
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
             stringr::str_detect(stringr::str_to_lower(value), "^based mainly on expert opinion") ~ "estimateExpert",
             stringr::str_detect(stringr::str_to_lower(value), "^insufficient or no data") ~ "absentData",
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
             stringr::str_detect(stringr::str_to_lower(value), "area covered by population") ~ "area",
             stringr::str_to_lower(value) ==  "number of breeding females"  ~  "bfemales",
             stringr::str_to_lower(value) ==  "number of calling males"  ~  "cmales",
             stringr::str_to_lower(value) ==  "number of colonies"  ~  "colonies",
             stringr::str_to_lower(value) ==  "number of flowering stems"  ~  "fstems",
             stringr::str_to_lower(value) ==  "number of map 10x10 km grid cells"  ~  "grids10x10",
             stringr::str_to_lower(value) ==  "number of map 1x1 km grid cells"  ~  "grids1x1",
             stringr::str_to_lower(value) ==  "number of map 2x2 km grid cells"  ~  "grids2x2",
             stringr::str_to_lower(value) ==  "number of map 5x5 km grid cells"  ~  "grids5x5",
             stringr::str_to_lower(value) ==  "number of individuals"  ~  "i",
             stringr::str_to_lower(value) ==  "number of wintering individuals"  ~  "iwintering",
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

#' Recode trends
#' 
#' This function changes the descriptive trends text to
#' the abbreviated text used in the reporting tool 
#'
#' @param trends character, trends text
#'
#' @return character, abbreviated trends text
#' @export
#'
#' @examples
#' recode_trends("Increasing (+)")
recode_trends <- function(trends) {
  
  tibble::as.tibble(trends) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "decreasing") ~ "D",
             stringr::str_detect(stringr::str_to_lower(value), "increasing") ~ "I",
             stringr::str_detect(stringr::str_to_lower(value), "stable") ~ "S",
             stringr::str_detect(stringr::str_to_lower(value), "^uncertain") ~ "U",
             stringr::str_detect(stringr::str_to_lower(value), "^unknown") ~ "Unk",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode favourable range operators
#' 
#' This function changes the descriptive favourable range operators 
#' text to the abbreviated text used in the reporting tool 
#'
#' @param operator character, favourable range operators text
#'
#' @return character, abbreviated favourable range operators text
#' @export
#'
#' @examples
#' recode_favourable_range_operators("Much more than (>>)")
recode_favourable_range_operators <- function(operator) {
  
  tibble::as.tibble(operator) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "approximately equal") ~ "aeq",
             stringr::str_detect(stringr::str_to_lower(value), "less than") ~ "lt",
             stringr::str_detect(stringr::str_to_lower(value), "^more than") ~ "mt",
             stringr::str_detect(stringr::str_to_lower(value), "^much more than") ~ "mmt",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode reason change
#'
#' This function changes the descriptive reason change
#' text to the abbreviated text used in the reporting tool 
#'
#' @param reason character, reason change text
#'
#' @return character, abbreviated freason change text
#' @export
#'
#' @examples
#' recode_reason_change("Improved knowledge/more accurate data")
recode_reason_change <- function(reason) {
  
  tibble::as.tibble(reason) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "genuine") ~ "genuine",
             stringr::str_detect(stringr::str_to_lower(value), "improved knowledge") ~ "knowledge",
             stringr::str_detect(stringr::str_to_lower(value), "different method") ~ "method",
             stringr::str_detect(stringr::str_to_lower(value), "^no change") ~ "noChange",
             stringr::str_detect(stringr::str_to_lower(value), "^no information") ~ "noInfo",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode type of estimate
#' 
#' This function changes the descriptive type of estimate
#' text to the abbreviated text used in the reporting tool 
#'
#' @param estimate character, type of estimate text
#'
#' @return character, type of estimate abbreviated text
#' @export
#'
#' @examples
#' recode_type_of_estimate("Multi-year mean")
recode_type_of_estimate <- function(estimate) {
  
  tibble::as.tibble(estimate) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "best estimate") ~ "estimate",
             stringr::str_detect(stringr::str_to_lower(value), "confidence interval") ~ "interval",
             stringr::str_detect(stringr::str_to_lower(value), "multi-year mean") ~ "mean",
             stringr::str_detect(stringr::str_to_lower(value), "minimum") ~ "minimum",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode yes, no or unknown
#' 
#' This function changes the descriptive yes, no or unknown
#' text to the abbreviated text used in the reporting tool 
#'
#' @param yes_no_unknown character, yes, no or unknown text
#'
#' @return character, yes, no or unknown abbreviated text
#' @export
#'
#' @examples
#' recode_yes_no_unknown("Unknown")
recode_yes_no_unknown <- function(yes_no_unknown) {
  
  tibble::as.tibble(yes_no_unknown) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) == "no" ~ "N",
             stringr::str_to_lower(value) == "unknown" ~ "Unk",
             stringr::str_to_lower(value) == "yes" ~ "Y",
             TRUE ~ value
           )) %>% 
    unlist()
  
}

#' Recode yes to x
#'
#' This function changes yes to x used in the reporting tool
#' and removes no
#'
#' @param yes_no_x character, yes or no text
#'
#' @return character, x or NA_character_
#' @export
#'
#' @examples
#' recode_yes_no_x("Yes")
recode_yes_no_x <- function(yes_no_x) {
  
  tibble::as.tibble(yes_no_x) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) == "no" ~ NA_character_,
             stringr::str_to_lower(value) == "yes" ~ "x",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode ranking
#'
#' This function changes the descriptive ranking text
#' to the abbreviated text used in the reporting tool 
#'
#' @param ranking character, ranking text
#'
#' @return character, abbreviated ranking text
#' @export
#'
#' @examples
#' recode_ranking("High (H)")
recode_ranking <- function(ranking) {
  
  tibble::as.tibble(ranking) %>% 
    dplyr::mutate(value = dplyr::case_when
           ( 
             stringr::str_detect(stringr::str_to_lower(value), "high") ~ "H",
             stringr::str_detect(stringr::str_to_lower(value), "medium") ~ "M",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode ranking type
#'
#' This function changes the descriptive ranking type text
#' to the abbreviated text used in the reporting tool 
#' 
#' @param type character, ranking type text
#'
#' @return character, ranking type abbreviated text
#' @export
#'
#' @examples
#' recode_ranking_type("pressure_ranking")
recode_ranking_type <- function(type) {
  
  tibble::as.tibble(type) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) == "pressure_ranking" ~ "p",
             stringr::str_to_lower(value) == "threat_ranking" ~ "t",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode measures identified
#' 
#' This function changes the descriptive measures identified text
#' to the abbreviated text used in the reporting tool 
#'
#' @param measure character, measures identified text
#'
#' @return character, measures identified abbreviated text
#' @export
#'
#' @examples
#' recode_measures_identified("Measures needed but cannot be identified")
recode_measures_identified <- function(measure) {
  
  tibble::as.tibble(measure) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "none yet taken") ~ "ident",
             stringr::str_detect(stringr::str_to_lower(value), "cannot be identified") ~ "notIdent",
             stringr::str_detect(stringr::str_to_lower(value), "identified and taken") ~ "taken",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode species measures purpose
#' 
#' This function changes the descriptive measures purpose text
#' for species to the abbreviated text used in the reporting tool 
#'
#' @param purpose character, measures purpose text 
#'
#' @return character, measures purpose abbreviated text 
#' @export
#'
#' @examples
#' recode_measures_purpose_species("Maintain the current range, population and/or habitat for the species")
recode_measures_purpose_species <- function(purpose) {
  
  tibble::as.tibble(purpose) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "^expand") ~ "expand",
             stringr::str_detect(stringr::str_to_lower(value), "^increase") ~ "increase",
             stringr::str_detect(stringr::str_to_lower(value), "^maintain") ~ "maintain",
             stringr::str_detect(stringr::str_to_lower(value), "^restore") ~ "restore",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode habitat measures purpose
#' 
#' This function changes the descriptive measures purpose text
#' for habitat to the abbreviated text used in the reporting tool 
#'
#' @param purpose character, measures purpose text 
#'
#' @return character, measures purpose abbreviated text 
#' @export
#'
#' @examples
#' recode_measures_purpose_habitat("Maintain the current range, surface area or structure and functions of the habitat type")
recode_measures_purpose_habitat <- function(purpose) {
  
  tibble::as.tibble(purpose) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "^expand") ~ "expand",
             stringr::str_detect(stringr::str_to_lower(value), "^increase") ~ "increase",
             stringr::str_detect(stringr::str_to_lower(value), "^maintain") ~ "maintain",
             stringr::str_detect(stringr::str_to_lower(value), "^restore") ~ "restore",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode measures location
#' 
#' This function changes the descriptive measures location text
#' to the abbreviated text used in the reporting tool 
#'
#' @param location character, measures location text
#'
#' @return character, measures location abbreviation text
#' @export
#'
#' @examples
#' recode_measures_location("Both inside and outside Natura 2000")
recode_measures_location <- function(location) {
  
  tibble::as.tibble(location) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "^only inside") ~ "in",
             stringr::str_detect(stringr::str_to_lower(value), "^both") ~ "inOut",
             stringr::str_detect(stringr::str_to_lower(value), "^only outside") ~ "out",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode measures response
#' 
#' This function changes the descriptive measures response text
#' to the abbreviated text used in the reporting tool 
#'
#' @param response character, measures response text
#'
#' @return character, measures response abbreviated text
#' @export
#'
#' @examples
#' recode_measures_response("Medium-term results (within the next two reporting periods, 2019-2030)")
recode_measures_response <- function(response) {
  
  tibble::as.tibble(response) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "^long-term") ~ "lonTerm",
             stringr::str_detect(stringr::str_to_lower(value), "^medium-term") ~ "medTerm",
             stringr::str_detect(stringr::str_to_lower(value), "^short-term") ~ "srtTerm",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode prospects
#' 
#' This function changes the descriptive prospects text
#' to the abbreviated text used in the reporting tool 
#'
#' @param prospect character, prospects text
#'
#' @return character, prospects abbreviated text
#' @export
#'
#' @examples
#' recode_prospects("Unknown")
recode_prospects <- function(prospect) {
  
  tibble::as.tibble(prospect) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_to_lower(value) == "bad" ~ "bad",
             stringr::str_to_lower(value) == "good" ~ "good",
             stringr::str_to_lower(value) == "poor" ~ "poor",
             stringr::str_to_lower(value) == "unknown" ~ "unk",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode assessments
#' 
#' This function changes the descriptive assessments text
#' to the abbreviated text used in the reporting tool 
#'
#' @param assessments character, assessments text
#'
#' @return character, assessments abbreviated text
#' @export
#'
#' @examples
#' recode_assessments("Unfavourable-inadequate")
recode_assessments <- function(assessments) {
  
  tibble::as.tibble(assessments) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "^favourable") ~ "FV",
             stringr::str_detect(stringr::str_to_lower(value), "^unfavourable-inadequate") ~ "U1",
             stringr::str_detect(stringr::str_to_lower(value), "^unfavourable-bad") ~ "U2",
             stringr::str_detect(stringr::str_to_lower(value), "^unknown") ~ "XX",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode trends conclusion
#' 
#' This function changes the descriptive trends conclusion text
#' to the abbreviated text used in the reporting tool  
#'
#' @param trend character, trends conclusion text
#'
#' @return character, trends conclusion abbreviation text
#' @export
#'
#' @examples
#' recode_trends_conclusion("Improving (+)")
recode_trends_conclusion <- function(trend) {
  
  tibble::as.tibble(trend) %>% 
    dplyr::mutate(value = dplyr::case_when
           (
             stringr::str_detect(stringr::str_to_lower(value), "^deteriorating") ~ "D",
             stringr::str_detect(stringr::str_to_lower(value), "^improving") ~ "I",
             stringr::str_detect(stringr::str_to_lower(value), "^stable") ~ "S",
             stringr::str_detect(stringr::str_to_lower(value), "^unknown") ~ "Unk",
             TRUE ~ value
           )) %>% 
    unlist()
}

#' Recode future prospects UK fields
#' 
#' This function changes the less than or equal
#' sign to ones that are handled in R
#'
#' @param prospect character, future prospects UK fields text
#'
#' @return character, future prospects UK fields text, less than or equal sign removed
#' @export
#'
#' @examples
#' recode_future_prospects_uk_fields ("Negative - decreasing ≤1% (one percent or less) per year on average")
#' recode_future_prospects_uk_fields ("Very Negative - decreasing >1% (more than one percent) per year on average")
#' recode_future_prospects_uk_fields ("Positive - increasing ≤1% (one percent or less) per year on average")
#' recode_future_prospects_uk_fields ("Very Positive - increasing >1% (more than one percent) per year on average")
recode_future_prospects_uk_fields <- function(prospect) {
  
  tibble::as.tibble(prospect) %>% 
    dplyr::mutate(value = dplyr::case_when
                  (
                    stringr::str_detect(stringr::str_to_lower(value), "^negative") 
                        ~ "Negative - decreasing <=1% (one percent or less) per year on average",
                    stringr::str_detect(stringr::str_to_lower(value), "^positive") 
                        ~ "Positive - increasing <=1% (one percent or less) per year on average",
                    TRUE ~ value
                  )) %>% 
    unlist()
}


#' Recode rate of decrease UK fields
#'
#' This function changes the less than or equal
#' sign to ones that are handled in R
#'
#' @param rate character, rate of decrease UK fields text
#'
#' @return character, rate of decrease UK fields text, less than or equal sign removed
#' @export
#'
#' @examples
#' recode_rate_of_decrease_uk_fields ("Decreasing ≤1% (one percent or less) per year on average")
#' recode_rate_of_decrease_uk_fields ("Decreasing >1% (more than one percent) per year on average")
recode_rate_of_decrease_uk_fields <- function(rate) {
  
  tibble::as.tibble(rate) %>% 
    dplyr::mutate(value = dplyr::case_when
                  (
                    stringr::str_detect(stringr::str_to_lower(value), "one percent or less") 
                    ~ "Decreasing <=1% (one percent or less) per year on average",
                    TRUE ~ value
                  )) %>% 
    unlist()
  
}

#' Recode country to abbrevation
#' 
#' This function recodes the country to a corresponding
#' 2 letter abbreviation. This is used for example in
#' the country file paths
#'
#' @param country character, country name
#'
#' @return character, country abbreviation
#' @export
#'
#' @examples
#' recode_country_abbreviation("N.Ireland")
recode_country_abbreviation <- function(country) {
  
  tibble::as.tibble(country) %>% 
    dplyr::mutate(value = dplyr::case_when
                  (
                    stringr::str_to_lower(value) == "england" ~ "EN",
                    stringr::str_remove(stringr::str_to_lower(value), "[[:space:]]+") == "n.ireland" ~ "NI",
                    stringr::str_to_lower(value) == "scotland" ~ "SC",
                    stringr::str_to_lower(value) == "wales" ~ "WA",
                    stringr::str_to_lower(value) == "offshore" ~ "OFF",
                    TRUE ~ value
                  )) %>% 
    unlist()
}

#' Recode country to country agency
#'
#' This function recodes the country to the statutary
#' nature conservation body (country agency) within that 
#' country
#'
#' @param country character, country name
#'
#' @return character, country agency
#' @export
#'
#' @examples
#' recode_country_agency("N.Ireland")
recode_country_agency <- function(country) {
  
  tibble::as.tibble(country) %>% 
    dplyr::mutate(value = dplyr::case_when
                  (
                    stringr::str_to_lower(value) == "england" ~ "Natural England",
                    stringr::str_remove(stringr::str_to_lower(value), "[[:space:]]+") == "n.ireland" ~ "Northern Ireland Environment Agency",
                    stringr::str_to_lower(value) == "scotland" ~ "Scottish Natural Heritage",
                    stringr::str_to_lower(value) == "wales" ~ "Natural Resources Wales",
                    stringr::str_to_lower(value) == "offshore" ~ "Joint Nature Conservation Committee",
                    TRUE ~ value
                  )) %>% 
    unlist()
}

