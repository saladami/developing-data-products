# The user-interface definition of the Shiny web app.
library(shiny)
require(data.table)


source("fitbitdata.R")                        
fluidPage(
    titlePanel("Fitbit activity data explorer"),
    sidebarLayout(
        sidebarPanel(
            
                    #fileInput('file1', 'Choose file to upload'),
                    #I gave up on trying to get this to work and just went with an "example" file
            
                     sliderInput("Date.range", "Date range:", min = 1, max = 93, value = c(1, 30)),
                     
                     
                     #additional UI components (I.e. radio buttons) go
                     hr(),
                     
                     checkboxGroupInput("variable", "Variable:", choices = names(fb), selected = names(fb))
                     
                     #checkboxGroupInput("checkGroup", label = h3("Show Levels of Activity"), 
                      #                  choices = list("Sedentary" = 1, "Lightly Active" = 2, "Fairly Active" = 3, "Very Active" = 4),
                       #                 selected = 1:4),
                     #checkboxGroupInput("checkGroup", label = h3("Show Calories Burned"), 
                      #                  choices = list("Total Calories" = 1, "Activity Calories" = 2), selected = 1:2),
                     #hr(),
                     #
                     #checkboxGroupInput("checkGroup", label = h3("Raw Distance"), 
                      #                  choices = list("Steps" = 1, "Distance" = 2, "Floors Climbed" = 3), selected = 1:3)
                     
                     
                     
                     ),
        
        
        
        
        
        
        
        mainPanel(
            tableOutput('contents')
            )
    )
)