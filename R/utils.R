dataPrep <- function(lData) {
  n <- length(lData[[1]])
  retList <- list()
  tmp <- rep(list(NA), 5)
  names(tmp) <- c("title", "subtitle", "ranges", "measures", "markers")
  retList[[1]] <- tmp
  for (i in 1:n) {
    tmp[[1]] <- lData$title[[i]]
    tmp[[2]] <- lData$subtitle[[i]]
    tmp[[3]] <- lData$range[[i]]
    tmp[[4]] <- lData$measures[[i]]
    tmp[[5]] <- lData$markers[[i]]
    retList[[i+1]] <- tmp
  }
  return(retList)
}


