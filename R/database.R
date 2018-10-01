#' Get SQL Server connection
#' 
#' This function initiates a SQL Server connection
#' using the keyring package to store the database
#' credentials
#'
#' @param keyring_name character, name of keyring
#' @param service_name chracter, name of service storing credentials
#'
#' @return connection object, SQL Server connection object
#' @export
#'
#' @examples
#' get_sqlserver_connection("keyring", "database_service_name")
get_sqlserver_connection <- function(keyring_name, service_name) {
  keyring::keyring_unlock(keyring_name)
  conn <- tryCatch(DBI::dbConnect(odbc::odbc(),
                                  driver = "SQL Server",
                                  server = jsonlite::fromJSON(keyring::key_get(keyring = keyring_name, 
                                                                               service = service_name))[["server"]],
                                  database = jsonlite::fromJSON(keyring::key_get(keyring = keyring_name, 
                                                                                 service = service_name))[["database"]]),
                   error = function(e) {stop("Connection to SQL SERVER UNSUCCESSFUL", call. = FALSE)})
  keyring::keyring_lock(keyring_name)
  return(conn)
}