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
#' @import data.table
visualize_mobility_data <- function(mobility_data){

  options(spinner.color = "#000000", spinner.type = 6, spinner.color.background = "#ffffff", spinner.size = 0.5)

  por.pais <- mobility_data[sub_region_1 == ""] %>%
    melt(measure = patterns("from_baseline"), variable.name = "tipo", value.name = "valor")

  por.pais[, label := stringr::str_glue("<b>Country</b>: {por.pais$country_region}
                             <b>Activity</b>: {por.pais$tipo}
                             <b>Value</b>: {paste0(por.pais$valor, '%')}") %>%
             purrr::map(htmltools::HTML)]

  paises <- por.pais[, unique(country_region)]
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
                                           justified = TRUE)
                                       ),
                                       shiny::fluidRow(
                                         plotly::plotlyOutput("plot_pais", height = "auto") %>% shinycssloaders::withSpinner(hide.ui = FALSE)
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
                                                       align = "center")
                                       ),
                                       shiny::fluidRow(
                                         plotly::plotlyOutput("plot_sr1") %>% shinycssloaders::withSpinner(hide.ui = FALSE)
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
                                                           `live-search` = TRUE) %>% shinycssloaders::withSpinner(hide.ui = FALSE)
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
                                                       align = "center")),
                                       shiny::fluidRow(
                                         plotly::plotlyOutput("plot_sr2")
                                       )
                       )
    )

  )

  server <- function(input, output) {

    #Tab by country
    output$plot_pais <- plotly::renderPlotly({



      if(input$comparacion_pais == "By country"){
        plot.pais <- por.pais %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = country_region, text = label)) +
          ggplot2::geom_hline(yintercept = 0, linetype = "dashed", alpha = 0.8) +
          ggplot2::geom_line(alpha = 0.8) +
          ggplot2::facet_wrap(tipo~., ncol = 2) +
          ggplot2::labs(x = "Date", y = "Value", col = "Country") +
          ggplot2::theme_bw()
      }else{
        plot.pais <- por.pais %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = tipo, text = label)) +
          ggplot2::geom_hline(yintercept = 0, linetype = "dashed", alpha = 0.8) +
          ggplot2::geom_line(alpha = 0.8) +
          ggplot2::facet_wrap(country_region_code~., ncol = 2) +
          ggplot2::labs(x = "Date", y = "Value", col = "Activity") +
          ggplot2::theme_bw()
      }

      ggrows <- plot.pais %>%
        ggplot2::ggplot_build()  %>%
        magrittr::extract2('layout')       %>%
        magrittr::extract2('layout') %>%
        magrittr::extract2('ROW')          %>%
        unique()                           %>%
        length()

      plot.pais %>% plotly::ggplotly(height = as.numeric(ggrows * 300), tooltip = 'text', dynamicTicks = TRUE)

    })


    #Tab by sub-region 1
    por.sr1 <- shiny::reactive({

      dt <- mobility_data[country_region == input$input_pais & sub_region_1 != "" & sub_region_2 == ""] %>%
        melt(measure = patterns("from_baseline"), variable.name = "tipo", value.name = "valor")

      dt[, label := stringr::str_glue("<b>Country</b>: {dt$country_region}
                             <b>Sub-region 1</b>: {dt$sub_region_1}
                             <b>Activity</b>: {dt$tipo}
                             <b>Value</b>: {paste0(dt$valor, '%')}") %>%
                 purrr::map(htmltools::HTML)]

      dt
    })

    output$plot_sr1 <- plotly::renderPlotly({

      if(input$comparacion_sr1 == "By sub-region 1"){
        plot.sr1 <- por.sr1() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = sub_region_1, text = label)) +
          ggplot2::geom_hline(yintercept = 0, linetype = "dashed", alpha = 0.8) +
          ggplot2::geom_line(alpha = 0.8) +
          ggplot2::facet_wrap(tipo~., ncol = 2) +
          ggplot2::labs(x = "Date", y = "Value", col = "Sub-region 1") +
          ggplot2::theme_bw()
      }else{
        plot.sr1 <- por.sr1() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = tipo, text = label)) +
          ggplot2::geom_hline(yintercept = 0, linetype = "dashed", alpha = 0.8) +
          ggplot2::geom_line(alpha = 0.8) +
          ggplot2::facet_wrap(sub_region_1~., ncol = 2) +
          ggplot2::labs(x = "Date", y = "Value", col = "Activity") +
          ggplot2::theme_bw()
      }

      ggrows <- plot.sr1 %>%
        ggplot2::ggplot_build()  %>%
        magrittr::extract2('layout')       %>%
        magrittr::extract2('layout') %>%
        magrittr::extract2('ROW')          %>%
        unique()                           %>%
        length()

      plot.sr1 %>% plotly::ggplotly(height = as.numeric(ggrows * 300), tooltip = 'text', dynamicTicks = TRUE)
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

      intermedio <- mobility_data[country_region == input$input_pais2 & sub_region_1 == input$input_sr1]

      if(length(unique(intermedio$sub_region_2)) > 1){
        intermedio <- intermedio[sub_region_2 != ""]

      }

      dt <- intermedio %>%
        melt(measure = patterns("from_baseline"), variable.name = "tipo", value.name = "valor")

      dt[, label := stringr::str_glue("<b>Country</b>: {dt$country_region}
                             <b>Sub-region 1</b>: {dt$sub_region_1}
                             <b>Sub-region 2</b>: {dt$sub_region_2}
                             <b>Activity</b>: {dt$tipo}
                             <b>Value</b>: {paste0(dt$valor, '%')}") %>%
           purrr::map(htmltools::HTML)]

      dt

    })


    output$plot_sr2 <- plotly::renderPlotly({

      if(input$comparacion_sr2 == "By sub-region 2"){
        plot.sr2 <- por.sr2() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = sub_region_2, text = label)) +
          ggplot2::geom_hline(yintercept = 0, linetype = "dashed", alpha = 0.8) +
          ggplot2::geom_line(alpha = 0.8) +
          ggplot2::facet_wrap(tipo~., ncol = 2) +
          ggplot2::labs(x = "Date", y = "Value", col = "Sub-region 2") +
          ggplot2::theme_bw()
      }else{
        plot.sr2 <- por.sr2() %>%
          ggplot2::ggplot(ggplot2::aes(x = as.Date(date), y = valor, col = tipo, text = label)) +
          ggplot2::geom_hline(yintercept = 0, linetype = "dashed", alpha = 0.8) +
          ggplot2::geom_line(alpha = 0.8) +
          ggplot2::facet_wrap(sub_region_2~., ncol = 2) +
          ggplot2::labs(x = "Date", y = "Value", col = "Activity") +
          ggplot2::theme_bw()
      }

      ggrows <- plot.sr2 %>%
        ggplot2::ggplot_build()  %>%
        magrittr::extract2('layout')       %>%
        magrittr::extract2('layout') %>%
        magrittr::extract2('ROW')          %>%
        unique()                           %>%
        length()

      plot.sr2 %>% plotly::ggplotly(height = as.numeric(ggrows * 300), tooltip = 'text', dynamicTicks = TRUE)

    })

  }

  shiny::shinyApp(ui = ui, server = server)

}
