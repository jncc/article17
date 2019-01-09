#' Get SQL Server connection
#' 
#' This function initiates a SQL Server connection either 
#' using stored database credentials using the keyring package
#' or else requesting database credentials
#'
#' @param keyring_name character, name of keyring
#' @param service_name character, name of service storing credentials
#' @param keyring logical, use of keyring TRUE (default) or FALSE
#'
#' @return connection object, SQL Server connection object
#' @export
#'
#' @examples
#' get_sqlserver_connection("keyring", "database_service_name")
get_sqlserver_connection <- function(keyring_name, service_name, keyring = TRUE) {
  if (!keyring) {
    server = readline("SQL server name: ")
    database = readline("Database name: ")
  } else{
    keyring::keyring_unlock(keyring_name)
    server = jsonlite::fromJSON(keyring::key_get(keyring = keyring_name, service = service_name))[["server"]]
    database = jsonlite::fromJSON(keyring::key_get(keyring = keyring_name, service = service_name))[["database"]] 
    keyring::keyring_lock(keyring_name)
  }
  conn <- tryCatch(DBI::dbConnect(odbc::odbc(),
                                  driver = "SQL Server",
                                  server = server,
                                  database = database),
                   error = function(e) {stop("Connection to SQL SERVER UNSUCCESSFUL", call. = FALSE)})
}

#' Get SQL Server connection string
#' 
#' This function returns the SQL Server connection string 
#' either using stored database credentials through the keyring 
#' package or else after requesting database credentials
#'
#' @param keyring_name character, name of keyring
#' @param service_name character, name of service storing credentials
#' @param keyring logical, use of keyring TRUE (default) or FALSE
#'
#' @return character, connection string
#' @export
#'
#' @examples
#' get_sqlserver_connection_string("keyring", "database_service_name")
get_sqlserver_connection_string <- function(keyring_name, service_name, keyring = TRUE) {
  if (!keyring) {
    server = readline("SQL server name: ")
    database = readline("Database name: ")
  } else {
    keyring::keyring_unlock(keyring_name)
    server = jsonlite::fromJSON(keyring::key_get(keyring = keyring_name, 
                                                 service = service_name))[["server"]]
    database = jsonlite::fromJSON(keyring::key_get(keyring = keyring_name, 
                                                   service = service_name))[["database"]]
    keyring::keyring_lock(keyring_name)
  }
  conn_string <- stringr::str_glue("MSSQL:server={server};database={database};trusted_connection=yes")
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
