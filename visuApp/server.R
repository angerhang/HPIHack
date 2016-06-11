# install.packages("shiny")
# install.packages("networkD3")
# install.packages("rjson")
library(rjson)
library(shiny)
library(networkD3)

shinyServer(function(input, output) {
  output$simple <- renderSimpleNetwork({
    src <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
    target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
    year <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
    networkData <- data.frame(src, target, year)   
    currentYear <- subset(networkData, year == input$year)
    simpleNetwork(currentYear)
  })
})
