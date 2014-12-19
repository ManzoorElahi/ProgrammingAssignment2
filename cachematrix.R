## Functions in cachematrix.R cache the inverse of a matrix and 
## retrieve the cached data whenever present.

## The function 'makeCacheMatrix(r=2,n=rnorm(r*r))' generates a square matrix of size r*r


makeCacheMatrix <- function(r=2,n = rnorm(r*r)) {
  mi <- NULL
  setm <- function(r1,n1) {
    if (length(n1)>r1^2) {
      n1 <- n1[1:r1^2]
    }
    else if (length(n1)<r1^2) {
      n1 <- c(n1,rnorm((r1^2)-length(n1)))
    }
    x <<- matrix(nrow=r1,ncol=r1,n1)
    mi <<- NULL
  }
  getm <- function() x
  setmi <- function(matrixinv) mi <<- matrixinv
  getmi <- function() mi
  list(setm = setm(r,n), getm = getm,
       setmi = setmi,
       getmi = getmi)
}


## The function 'cacheSolve(x,...) takes the output of makeCacheMatrix() as input.
## It solves for the inverse of input matrix and stores the result as cache.
## If the given input is already solved, then it retrieves the inverse of the 
## matrix from cache.

cacheSolve <- function(x, ...) {
  mi <- x$getmi()
  if(!is.null(mi)) {
    message("getting cached data")
    return(mi)
  }
  data <- x$getm()
  m <- solve(data, ...)
  x$setmi(m)
  m
}