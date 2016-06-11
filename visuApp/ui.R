library(shiny)
library(networkD3)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Wikidata Network vs Time"),
  # Sidebar with a slider input for the exact year
  sidebarLayout(
    sidebarPanel(
      # Needs to be changed based on the temporal coverage 
      sliderInput("year",
                  "Year",
                  min = 1,
                  max = 10,
                  value = 5,
                  step = 1)
    ),
    mainPanel(
      tabPanel("Simple Network", simpleNetworkOutput("simple"))
    )
  )
))