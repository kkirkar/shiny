#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(COVID19)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$covid19plot <- renderPlotly({
        if(!is.null(input$country)){
            
            x <- covid19(
                country = input$country, 
                level   = input$level, 
                start   = input$date[1], 
                end     = input$date[2]
            )
            
            color <- paste0("administrative_area_level_", input$level)
            plot_ly(x = x[["date"]], y = x[[input$type]], color = x[[color]])
        }
    })
    
})
