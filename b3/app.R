

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Iris"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("Species",
                        "Iris Species",
                        c("setosa","versicolor","virginica"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          plotOutput("irisPlot")
          
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$irisPlot <- renderPlot({
      iris1 <- filter(iris, Species == input$Species)
      ggplot(iris1, aes(x=Petal.Length, y=Sepal.Width)) +
      geom_point(color="deepskyblue4", position = "jitter") +
        geom_smooth(method = lm, alpha = .25, color="cornflowerblue", level=0)
                  
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
