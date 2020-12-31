#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(COVID19)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Covid-19 Dashboard"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                "country", 
                label    = "Country", 
                multiple = TRUE, 
                choices  = unique(covid19()$administrative_area_level_1), 
                selected = "Japan"
            ),
            selectInput(
                "type", 
                label    = "type", 
                choices  = c("confirmed", "tests", "recovered", "deaths")
            ),
            selectInput(
                "level", 
                label    = "Granularity", 
                choices  = c("Country" = 1, "Region" = 2, "City" = 3), 
                selected = 2
            ),
            dateRangeInput(
                "date", 
                label    = "Date", 
                start    = "2020-01-01"
            ),
            a("Documentation", href="https://github.com/kkirkar/shiny/")
        ),
        
        mainPanel(
            h3("Visualization Covid-19"),
            plotlyOutput("covid19plot")
        )
    )
))
