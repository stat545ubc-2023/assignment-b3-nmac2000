

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Iris"),

    # Sidebar with a slider input for number of bins 
        fluidRow(
        column(4,
            selectInput("Species",
                        "Iris Species",
                        c("setosa","versicolor","virginica"))
        ),

        # Show a plot of the generated distribution
        column(8,
          plotOutput("irisPlot")
          
        )
    ),
    fluidRow(
      column(12,
             img(src='iris.png', align = "right")
    ))
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$irisPlot <- renderPlot({
      iris1 <- filter(iris, Species == input$Species)
      ggplot(iris1, aes(x=Petal.Length, y=Sepal.Width)) +
      geom_point(color="deepskyblue4", position = "jitter") 
                  
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
