#' Read aggregation spreadsheet
#' 
#' This function reads the specified aggregation spreadsheet, extracting
#' the UK information required for import into the UK reporting tool
#'
#' @param spreadsheet_name character, name of spreadsheet to read
#' @param skip_rows integer, number of rows to skip at top of spreadsheet
#'
#' @return dataframe, dataframe containing the three required columns
#' @export
#'
#' @examples
#' read_aggregation_spreadsheet("1 General Information")
read_aggregation_spreadsheet <- function(spreadsheet_name, skip_rows = 7) {
  
  # Read in spreadsheet and filter on completed species ready for aggregation
  readxl::read_excel(feature_path, sheet = spreadsheet_name, skip = skip_rows) %>% 
    janitor::clean_names() %>% 
    dplyr::select(field_name, uk_level_entry, uk_level_audit_notes) %>% 
    dplyr::filter(!is.na(field_name))
}

#' Extract UK assessment
#'
#' This function extracts UK assessment from the data frame created by
#' using read_aggregation_spreadsheet
#'
#' @param data dataframe, created from read_aggregation_spreadsheet function
#'
#' @return dataframe, containing UK information spread across columns
#' @export
#'
#' @examples
#' extract_uk_assessment("general_information")
extract_uk_assessment <- function(data) {
  # remove audit information and spread assessment columns
  data %>%
    dplyr::select(-uk_level_audit_notes) %>%
    # prevent column order being sorted alpabetically
    # https://stackoverflow.com/questions/29381069/implicit-sorting-in-tidyrspread-and-dplyrsummarise/29383859
    dplyr::mutate(field_name = factor(field_name, levels = unique(field_name))) %>% 
    tidyr::spread(field_name, uk_level_entry) %>% 
    # all columns converted to character on spreading
    # https://github.com/tidyverse/tidyr/issues/118
    readr::type_convert() %>% 
    dplyr::mutate_if(is.logical, as.character)
}