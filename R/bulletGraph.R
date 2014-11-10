#' Create a Bullet Graph
#'
#' @param List a list with the data. See example of the structure.
#' @param height height for the graph's frame area in pixels (if
#'   \code{NULL} then height is automatically determined based on context)
#' @param width numeric width for the graph's frame area in pixels (if
#'   \code{NULL} then width is automatically determined based on context)
#' @param fontSizeTitle numeric font size in pixels for the title text labels.
#' @param fontSize numeric font size in pixels for the text labels (subtitle and
#' axis text).
#' @param lineStroke character string specifying the colour you want the lines 
#' lines to be. Multiple formats supported (e.g. hexadecimal).
#' @param markerStroke character string specifying the colour you want the marker 
#' to be. Multiple formats supported (e.g. hexadecimal).
#' @param colRange character string vector specifying the colour you want the 
#' ranges to be
#' @param colMeasure character string vector specifying the colour you want the 
#' measures to be
#'
#' 
#' @examples
#' ## dontrun
#' ## Create Example from http://bl.ocks.org/mbostock/4061961
#' ytd2005 <- list(
#'   title=list("Revenue", "Profit", "Order Size", "New Customers", "Satisfaction"),
#'   subtitle=list("US$, in thousands", "%", "US$, average", "count", "out of 5"),
#'   range=list(c(150, 225, 300),
#'              c(20, 25, 30),
#'              c(350, 500, 600),
#'              c(1400, 2000, 2500),
#'              c(3.5, 4.25, 5)),
#'   measures=list(c(220, 270),
#'                 c(21, 23),
#'                 c(100, 320),
#'                 c(1000, 1650),
#'                 c(3.2, 4.7)),
#'   markers=list(250, 26, 550, 2100, 4.2)
#' )
#' 
#' # Visualize the Bullte Graph
#' bulletGraph(List = ytd2005)
#' 
#' @source http://www.perceptualedge.com/articles/misc/Bullet_Graph_Design_Spec.pdf
#' 
#' Mike Bostock: \url{http://bl.ocks.org/mbostock/4061961}.
#'
#' @export
#' 
bulletGraph <- function (
  List,
  height        = NULL,
  width         = NULL,
  fontSizeTitle = 14,
  fontSize      = 10,
  lineStroke    = "#666",
  markerStroke  = "#000",
  colRange      = c("#eee", "#ddd", "#ccc"),
  colMeasure    = c("lightsteelblue", "steelblue"))
{
  # validate input
  if (!is.list(List))
    stop("List must be a list object.")
  
  # ugly there is a bug that do not show the first element; I do not know why.
  # so I add an empty element as first element
  
  List <- dataPrep(List)
  root <- jsonlite::toJSON(List)
  
  # create options
  options = list(
    height        = height,
    width         = width,
    fontSizeTitle = fontSizeTitle,
    fontSize      = fontSize,
    lineStroke    = lineStroke,
    markerStroke  = markerStroke,
    colRangeS0    = colRange[1],
    colRangeS1    = colRange[2],
    colRangeS2    = colRange[3],
    colMeasureS0  = colMeasure[1],
    colMeasureS1  = colMeasure[2]
  )
  
  # create widget
  htmlwidgets::createWidget(
    name = "bulletGraph",
    x = list(root = root, options = options),
    width = width,
    height = height,
    htmlwidgets::sizingPolicy(viewer.suppress     = TRUE,
                              browser.fill        = TRUE,
                              browser.padding     = 75,
                              knitr.figure        = FALSE,
                              knitr.defaultWidth  = 800,
                              knitr.defaultHeight = 500),
    package = "d3Dashboard")
}

#' @rdname d3Dashboard-shiny
#' @export
bulletGraphOutput <- function(outputId, width = "100%", height = "800px") {
  shinyWidgetOutput(outputId, "bulletGraph", width, height,
                    package = "d3Dashboard")
}

#' @rdname d3Dashboard-shiny
#' @export
renderBulletGraph <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, bulletGraphOutput, env, quoted = TRUE)
}
