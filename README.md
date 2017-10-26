<!-- README.md is generated from README.Rmd. Please edit that file -->
pieR
====

[![Build Status](https://travis-ci.org/jumpingrivers/pieR.svg?branch=master)](https://travis-ci.org/jumpingrivers/pieR)

A utility package for creating d3 pie charts based on the RStudio js tutorials.

Installation
------------

You can install **pieR** from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("jumpingrivers/pieR")
```

Example
-------

A couple of basic examples of the `pie()` function:

``` r
library("pieR")
pie(1:5)
pie(c(5, 5, 5))
```

A basic Shiny example
=====================

``` r
## Only run this in interactive R sessions
if(interactive()) {
  library("shiny")
  ui = fluidPage(
    titlePanel("Pie Example!"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("obs", 
                    "Generate n random Numbers", 
                    min = 2, 
                    max = 10, 
                    value = 5)
      ),
      mainPanel(
        pieOutput("piePlot"),
        textOutput("randNo")
      )
    )
  )
  # Define the server code
  server = function(input, output) {
    numbers = reactive(round(runif(input$obs, 1, 10),0))
    output$piePlot = renderPie({
      pie(numbers())
    })
    output$randNo = renderText({
      numbers()
    })
  }
  shinyApp(ui = ui, server = server)
}
```
