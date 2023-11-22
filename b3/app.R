

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Iris"),

    #Sidebar with options to choose species for the graph, which is useful because it allows the user to see the differneces between each species
        fluidRow(
        column(4, 
            selectInput("Species",
                        "Iris Species",
                        c("setosa","versicolor","virginica"))
        ),

        # Show a plot of the petal and sepal length
        column(8,
          plotOutput("irisPlot")
          
        )
    ),
    fluidRow(
      column(12, #Had to use fluidRow and make a unique layout with columns so that I could put the image on the same page as the graph
             img(src='iris.png', align = "right") #add image showing the 3 different species, which is useful because it shows what the petal and sepal looks like on each flower
    ))
)

# Define server logic required to draw a plot
server <- function(input, output) {

  output$irisPlot <- renderPlot({
      iris1 <- filter(iris, Species == input$Species)
      ggplot(iris1, aes(x=Petal.Length, y=Sepal.Length)) +
      geom_point(color="deepskyblue4", position = "jitter") 
                  
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
