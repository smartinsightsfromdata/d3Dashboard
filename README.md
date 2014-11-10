Tools for creating D3 graphs from R
===========

Version 0.1

My first attempts of walking with D3 and R, motivated by Christopher Gandrud's package [networkD3](https://github.com/christophergandrud/networkD3). The great framework package [htmlwidgets](https://github.com/ramnathv/htmlwidgets) is used for this package. 

## Installation

To install and use you'll need to install this package and two of it's
dependencies from GitHub:

```S
library(devtools)
install_github(c('rstudio/htmltools',
              'ramnathv/htmlwidgets',
              'sipemu/d3Dashboard'))
```

## Usage

An example of a bullet graph:

```S
ytd2005 <- list(
  title=list("Revenue", "Profit", "Order Size", "New Customers", "Satisfaction"),
  subtitle=list("US$, in thousands", "%", "US$, average", "count", "out of 5"),
  range=list(c(150, 225, 300),
             c(20, 25, 30),
             c(350, 500, 600),
             c(1400, 2000, 2500),
             c(3.5, 4.25, 5)),
  measures=list(c(220, 270),
                c(21, 23),
                c(100, 320),
                c(1000, 1650),
                c(3.2, 4.7)),
  markers=list(250, 26, 550, 2100, 4.2)
)

# Plot
bulletGraph(ytd2005)
```
