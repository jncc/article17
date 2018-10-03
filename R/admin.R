
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

