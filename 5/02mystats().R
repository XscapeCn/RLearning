mystats <- function(x, parametric=TRUE, print = FALSE){
  if(parametric){
    center <- mean(x); spread <- sd(x)
  }else{
    center <- median(x); spread <- mad(x)
  }
  if(parametric&print){
    cat("Mean = ", center, "\n", "SD=", spread, "\n")
  }else if(print &! parametric){
    cat("Median= ", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center = center, spread = spread)
  return(result)
}

set.seed(1234)
x <- rnorm(500)

y <- mystats(x, parametric = FALSE, print = TRUE)
