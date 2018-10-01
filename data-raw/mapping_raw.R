# base_map_oga
# The coastline boundary was derived from the Oil and Gas Authority's OGA and Lloyd's Register SNS 
# Regional Geological Maps (Open Source) layer. Licence: Open Government Licence v3 (OGL) 
# (http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).Attribution: Contains 
# data © 2017 Oil & Gas Authority.
base_map_oga <- sf::st_read("./Range mapping/uki_boundaries/opendata/OGA/UKIrelandIoM_DECC_OSGB36.shp", stringsAsFactors = FALSE, quiet = TRUE) %>%
  janitor::clean_names() %>% 
  dplyr::mutate(uk = as.logical(uk))