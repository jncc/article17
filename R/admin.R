
#' Use test data
#'
#' This function filters data to selected species or
#' habitat codes. This is when testing the Article 17 
#' R scripts
#'
#' Selected test species are S1317 Pipistrellus nathusii and S1013_Vertigo geyeri,
#' habitats are H6230 Species-rich Nardus grassland and H7130 Blanket bogs
#' 
#' @param data data frame, all species or habitat data
#' @param test_data logical, whether to apply filter (default = TRUE) or not (FALSE)
#'
#' @return data frame, supplied or filter data for testing
#' @export
#'
#' @examples
#' use_test_data(data)
use_test_data <- function(data, test_data = TRUE) {

  if (test_data) {
    data <- data %>% 
      dplyr::filter(code %in% c("S1317", "S1013", "H6230", "H7130"))
  }
  return(data)
}

#' Export results log
#'
#' This function exports a log of success and failures resulting from
#' applying purrr's map functionality to iterate through a vector, applying
#' a safe function using purrr's safely functionality
#'
#' @param results list, contains the errors created from purrr's safely function
#' @param data_files vector, used to iterate through the safe function
#' @param log_path character or path object, path where log file will be exported
#'
#' @return csv, export log as a csv file
#' @export 
#'
#' @examples
export_results_log <- function(results, data_files, log_path) {
  
  # Logical success vector
  results_lgl <- results$error %>% 
    purrr::map_lgl(is_null)
  
  # Open log
  luzlogr::openlog(log_path)
  
  # Write successful files
  luzlogr::printlog(stringr::str_c("\n", "SUCCESS:"), ts = FALSE)
  data_files %>% 
    purrr::keep(results_lgl) %>% {
      luzlogr::printlog(str_c(., "\n"), ts = FALSE)
    }
  
  # Write failed files
  luzlogr::printlog("FAILED:", ts = FALSE)
  data_files %>% 
    purrr::discard(results_lgl) %>% {
      luzlogr::printlog(stringr::str_c(., "\n"), ts = FALSE)
    }
  
  # Write errors
  luzlogr::printlog("ERRORS:", ts = FALSE)
  luzlogr::printlog(results$error %>% purrr::discard(is_null), ts = FALSE)
  
  # Close log
  luzlogr::closelog(sessionInfo = FALSE)
}

#' Create reporting tool environment
#'
#' This function creates the reporting tool environment used to
#' store the id values required as primary and foreign keys in
#' the reporting tool database
#' 
#' @return
#' @export
#'
#' @examples
create_reporting_tool_environment <- function() {
  
  if (!exists("reporting_tool", mode = "environment")) {
    assign("reporting_tool", new.env(parent = emptyenv()), envir = globalenv())
    
    # assign values in environment
    assign("latest_species_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_species_annex_v_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_sr_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_change_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_measure_info_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_measure_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_pressure_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_pressure_info_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_notes_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_habitat_id", 0L, envir = reporting_tool, inherits = FALSE)
    assign("latest_hr_id", 0L, envir = reporting_tool, inherits = FALSE)
  }
}
