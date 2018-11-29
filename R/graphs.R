#' Graph of category percentages
#'
#' @param dataset, dataframe, containing category data 
#' @param filter_column character or factor, used for filtering
#' @param x_column character or factor, category data
#'
#' This function is a shiny app which summarises the categories
#' percentages within a filtered selection in a plot. The function 
#' can be added to a markdown document using runtime shiny.
#'
#' @return shiny ggplot
#' @export
#'
#' @examples
#' graph_category_percentage("dataframe_name", "filter_column", "category_values")
graph_category_percentage <- function(dataset, filter_column, x_column) {
  
  filter_column <- rlang::enquo(filter_column)
  x_column <- rlang::enquo(x_column)
  
  shinyApp(
    
    ui = fluidPage(
      selectInput("choice", label = "Choose one option",
                  choices = dataset %>% 
                    dplyr::distinct(!!filter_column)),
      plotOutput("dataset_plot")
    ),
    
    server = function(input, output) {
      
      selected_data = reactive({
        dataset <- dataset %>%
          dplyr::filter(!!filter_column == input$choice) %>% 
          dplyr::count(!!x_column) %>% 
          dplyr::mutate(percent = n / sum(n),
                        percent_label = stringr::str_glue("{round(percent * 100)} %"))
      })
      
      output$dataset_plot = renderPlot({
        ggplot2::ggplot(selected_data(), ggplot2::aes(x = reorder(!!x_column, percent), y = percent)) +
          ggplot2::geom_bar(stat = "identity", fill = "indianred3", color = "black") +
          ggplot2::geom_text(ggplot2::aes(label = percent_label), 
                    hjust = -0.2) +
          ggplot2::labs(x = NULL, 
               y = NULL, 
               title = stringr::str_glue("Percentage of each category within {input$choice}")) +
          ggplot2::scale_y_continuous(breaks = seq(0, 1, 0.05),
                             limits = c(0, 1), 
                             labels = scales::percent) + 
          ggplot2::coord_flip() +
          ggplot2::theme_minimal() +
          ggplot2::theme(plot.title = ggplot2::element_text(face = "bold", size = 16, hjust = 0.08),
                axis.text = ggplot2::element_text(face = "bold"),
                axis.text.x = ggplot2::element_text(size = 12),
                axis.text.y = ggplot2::element_text(size = 16),
                panel.grid.major.x = ggplot2::element_line(linetype = "dashed",colour = "#888888"),
                panel.grid.minor.x = ggplot2::element_blank(),
                panel.grid.major.y = ggplot2::element_blank()
          )
      })
    },
    options = list(height = 500L)
  )
  
}