library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Text Predictor - Final Project - 13/07/2020"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("txt", label = "Enter your text bellow:", value = "", width = NULL, placeholder = NULL),
            h5('After pressing \'Submit\', wait a moment and the results will be displayed.'),
            h5('(Input Examples: \'I would like to\' or \'Here are the\')'),
            actionButton("Submit","Submit")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h4('You had entered'),
            verbatimTextOutput("inputText"),
            h4('The predicted word(s) is(are):'),
            verbatimTextOutput("suggestions")
        )
    )
))