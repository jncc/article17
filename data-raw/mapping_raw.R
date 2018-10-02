# base_map
# The coastline boundary was derived from the Oil and Gas Authority's OGA and Lloyd's Register SNS 
# Regional Geological Maps (Open Source) layer. Licence: Open Government Licence v3 (OGL) 
# (http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).Attribution: Contains 
# data © 2017 Oil & Gas Authority.
base_map <- sf::st_read("./Range mapping/uki_boundaries/opendata/OGA/UKIrelandIoM_DECC_OSGB36.shp", stringsAsFactors = FALSE, quiet = TRUE) %>%
  janitor::clean_names() %>% 
  dplyr::mutate(uk = as.logical(uk))

# base_grid_bng
base_grid_bng <- sf::st_read("./Range mapping/grids/bng_10km_gbi.shp", stringsAsFactors = FALSE, quiet = TRUE)

# base_grid_etrs
base_grid_etrs <- sf::st_read("./Range mapping/grids/etrs_10km.shp", stringsAsFactors = FALSE, quiet = TRUE)

# base_grid_etrs_lookup
base_grid_bng_etrs_lookup <- sf::st_read("./Range mapping/grids/etrs_bng_lookup.shp", stringsAsFactors = FALSE, quiet = TRUE)


