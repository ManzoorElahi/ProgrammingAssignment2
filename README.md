### makeCacheMatrix(r=2,n=rnorm(r*r))

This function generates a square matrix of size r by r. If no iput is given then random matrix of 2 by 2 is generated. If the entered values are less than the required values to generate r by r matrix it the required number of random numbers. If the entered values are more then it skips the extra numbers.

### cacheSolve(x,...)
This function takes the output of makeCacheMatrix() as input.
It solves for the inverse of input matrix and stores the result as cache.
If the given input is already solved, then it retrieves the inverse of the 
matrix from cache.

