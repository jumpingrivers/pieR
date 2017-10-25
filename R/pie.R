#' @title Create elegant interactive pie charts.
#'
#' @description An easy way to create c3 pie charts based on the rstudio js tutorials.
#'
#' @import htmlwidgets
#' @param values A list of values with each it's own section of the pie chart.
#' @param legendPosition The position of the legend, default = "bottom".
#' @param width The width of the html widget.
#' @param height The width of the html widget.
#' @param elementId The element ID.
#' @examples
#' pie(c(1,2,3,4))
#'
#' pie(c(5,5,5))
#' @export
pie <- function(values, legendPosition = "bottom", width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    values = values,
    legendPosition = legendPosition
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'pie',
    x,
    width = width,
    height = height,
    package = 'pieR'
  )
}

#' @title Shiny bindings for pie
#'
#' @description Output and render functions for using pie within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a pie
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name pie-shiny
#'
#' @export
pieOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'pie', width, height, package = 'pieR')
}

#' @rdname pie-shiny
#' @export
renderPie <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, pieOutput, env, quoted = TRUE)
}
