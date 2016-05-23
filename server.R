library(shiny)
library(ggplot2)
#load file to process fitbit data
source("fitbitdata.R")
options(shiny.maxRequestSize = 9*1024^2)
fb <- get_fitbit_data("fitbit.csv")
shinyServer(function(input, output) 
{
    output$contents <- renderTable({fb[input$Date.range[1]:input$Date.range[2],input$variable]})
    
})