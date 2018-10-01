name_look_up <- tibble::tribble(
  ~name_old, ~name_new,
  "Phengaris arion", "Maculinea arion"
) %>%  
  tibble::deframe() %>% 
  as.list()