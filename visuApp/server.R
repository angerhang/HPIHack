# install.packages("shiny")
# install.packages("networkD3")
# install.packages("rjson")
library(rjson)
library(shiny)
library(networkD3)
library(plotly)
president <- read.csv("data/newPresidents.csv")

shinyServer(function(input, output) {
  output$simple <- renderSimpleNetwork({
    plot_ly(president, x = time, y = view, name = "Presidents", color = name)
    cat(nrow(president))
  })
})

