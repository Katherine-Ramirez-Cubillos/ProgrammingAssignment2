## Put comments here that give an overall description of what your
## functions do

#These two funcitons can cache potentially time-consuming computations. 
#These computations could relte to a very long vector of which we require the mean
# or a matrix of which we want to calculate the inverse. 


## Write a short comment describing this function

## This function creates a special matrix object that
## can cache its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- funciton(y){
    x <<- y
    inv <<- NULL
  }
  get <- function(){x}
  setInverse <- function(inverse){inv <<- inverse}
  getInverse <- function(){inv}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}

## Write a short comment describing this function

## This funciton computes the inverse of the special matrix returnes by
## makeCacheMatriz above, if the inverse already been calculate (and the matrix
## has not changed), then the cachesolve should retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) {
  inv <- x$getInverser()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  ## Return a matrix that is the inverse of 'x'
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
  
}

