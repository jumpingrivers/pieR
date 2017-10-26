<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/jumpingrivers/pieR.svg?branch=master)](https://travis-ci.org/jumpingrivers/pieR)

pieR
====

A utility package for creating c3 pie charts based on the rstudio js tutorials.

Installation
------------

You can install pieR from github with:

``` r
# install.packages("devtools")
devtools::install_github("jumpingrivers/pieR")
```

Example
-------

A couple of basic examples of the `pie()` function:

``` r
pie(c(1,2,3,4))
```

![](README-example-1.png)

``` r

pie(c(5,5,5))
```

![](README-example-2.png)

' A basic shiny example
=======================

``` r
## Only run this in interactive R sessions
if(interactive()){
ui <- fluidPage(
  titlePanel("Pie Example!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", 
                  "Generate n random Numbers", 
                  min = 2, 
                  max = 10, 
                  value = 5),
    ),
    mainPanel(
      pieOutput("piePlot"),
      textOutput("randNo")
    )
  )
)


# Define the server code
server <- function(input, output) {
  numbers = reactive(round(runif(input$obs,1,10),0))
         output$piePlot <- renderPie({
           pie(numbers())
           })
         output$randNo <- renderText({
           numbers()
           })
         }
shinyApp(ui = ui, server = server)
}
```