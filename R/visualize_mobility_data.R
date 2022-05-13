#' Shiny visualization tool for dowloaded Google mobility data
#'
#' @param mobility_data Data frame containing raw Google mobility data downloaded with \code{\link{mobility_var}} function
#'
#' @return Opens a Shiny app plotting the Google mobilty data in different ways
#' @export
#'
#' @examples
#' mobi <- mobility_var(c("AR", "BR", "CL"), c(2020, 2021))
#' visualize_mobility_data(mobi)
visualize_mobility_data <- function(mobility_data){

  por.pais <- mobility_data %>%
    dplyr::filter(sub_region_1 == "") %>%
    tidyr::pivot_longer(cols = tidyselect::ends_with("from_baseline"),
                 names_to = "tipo",
                 values_to = "valor",
                 values_drop_na = FALSE)

  paises <- base::unique(mobility_data$country_region)
  paises <- paises[base::order(paises)]

  ui <- shiny::fluidPage(

    shiny::titlePanel("Mobility data visualization"),

    shiny::tabsetPanel(type = "tabs",
                shiny::tabPanel("By country",
                                shiny::fluidRow(
                                  shinyWidgets::radioGroupButtons(
                             inputId = "comparacion_pais",
                             label = "Select comparison",
                             choices = c("By country", "By place"),
                             justified = TRUE),
                             shiny::plotOutput("plot_pais")
                         )
                ),
                shiny::tabPanel("By sub-regions 1",
                                shiny::fluidRow(
                                  shiny::column(6,
                                                shinyWidgets::pickerInput(
                                    inputId = "input_pais",
                                    label = "Select country",
                                    choices = paises,
                                    options = list(
                                      `live-search` = TRUE)
                                  ),
                                  align = "center"
                           )
                           ,
                           shiny::column(6,
                                         shinyWidgets::radioGroupButtons(
                                    inputId = "comparacion_sr1",
                                    label = "Select comparison",
                                    choices = c("By sub-region 1", "By place"),
                                    justified = TRUE),
                                  align = "center"),
                           shiny::plotOutput("plot_sr1")
                         )
                ),
                shiny::tabPanel("By sub-regions 2",
                                shiny::fluidRow(
                                  shiny::column(4,
                                                shinyWidgets::pickerInput(
                                    inputId = "input_pais2",
                                    label = "Select country",
                                    choices = paises,
                                    options = list(
                                      `live-search` = TRUE)
                                  )
                           ),
                           shiny::column(4,
                                         shiny::uiOutput('picker_sr1')
                           ),
                           shiny::column(4,
                                         shinyWidgets::radioGroupButtons(
                                    inputId = "comparacion_sr2",
                                    label = "Select comparison",
                                    choices = c("By sub-region 2", "By place"),
                                    justified = TRUE),
                                  align = "center"),
                           shiny::plotOutput("plot_sr2")
                         )
                )
    )

  )

  server <- function(input, output) {

    #Tab by country
    output$plot_pais <- shiny::renderPlot({

      if(input$comparacion_pais == "By country"){
        por.pais %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = country_region_code)) +
          ggplot2::geom_line() +
          ggplot2::facet_wrap(tipo~.)
      }else{
        por.pais %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = tipo)) +
          ggplot2::geom_line() +
          ggplot2::facet_wrap(country_region_code~.)
      }
    })


    #Tab by sub-region 1
    por.sr1 <- shiny::reactive({
      mobility_data %>%
        dplyr::filter(country_region == input$input_pais & sub_region_1 != "" & sub_region_2 == "") %>%
        tidyr::pivot_longer(cols = tidyselect::ends_with("from_baseline"),
                     names_to = "tipo",
                     values_to = "valor",
                     values_drop_na = FALSE)
    })

    output$plot_sr1 <- shiny::renderPlot({

      if(input$comparacion_sr1 == "By sub-region 1"){
        por.sr1() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = sub_region_1)) +
          ggplot2::geom_line() +
          ggplot2::facet_wrap(tipo~.)
      }else{
        por.sr1() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = tipo)) +
          ggplot2::geom_line() +
          ggplot2::facet_wrap(sub_region_1~.)
      }
    })

    #tab by sun-region 2:

    sub_regiones_1 <- shiny::reactive({
      nombres <- mobility_data %>%
        dplyr::filter(country_region == input$input_pais2 & sub_region_1 != "") %>%
        dplyr::pull(sub_region_1) %>%
        base::unique()

      nombres[base::order(nombres)]
    })

    output$picker_sr1 <- shiny::renderUI({
      shinyWidgets::pickerInput(
        inputId = "input_sr1",
        label = "Select sub-region 1",
        choices = sub_regiones_1(),
        options = list(
          `live-search` = TRUE)
      )
    })

    por.sr2 <- shiny::reactive({
      intermedio <- mobility_data %>%
        dplyr::filter(country_region == input$input_pais2 & sub_region_1 == input$input_sr1)

      if(length(base::unique(intermedio$sub_region_2)) > 1){
        intermedio <- intermedio %>%
          dplyr::filter(sub_region_2 != "")
      }

      intermedio  %>% tidyr::pivot_longer(cols = tidyselect::ends_with("from_baseline"),
                                   names_to = "tipo",
                                   values_to = "valor",
                                   values_drop_na = FALSE)
    })


    output$plot_sr2 <- shiny::renderPlot({

      if(input$comparacion_sr2 == "By sub-region 2"){
        por.sr2() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = sub_region_2)) +
          ggplot2::geom_line() +
          ggplot2::facet_wrap(tipo~.)
      }else{
        por.sr2() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = tipo)) +
          ggplot2::geom_line() +
          ggplot2::facet_wrap(sub_region_2~.)
      }
    })

  }

  shiny::shinyApp(ui = ui, server = server)

}
