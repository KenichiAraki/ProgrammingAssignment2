## Cache Usage Example
##
## How to use:
##   Step 1: create a special object from a matrix by makeCacheMatrix,
##   Step 2: compute an inverse of the matrix by cacheSolve,
##   Step 3: repeat step 2 and confirm a warning message,
##   Step 4: set a new matrix and repeat step 1-3.

## creates a special object with four functionarity:
##   set - caches a matrix object,
##   get - returns the chached matrix,
##   setinv - caches an inverse of the matrix,
##   getinv - returns the cached inverse.
##
## Remark:
##   This function assumes a passed matrix is invertible.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## Computes and returns an inverse of the matrix, or
## returns a cached inverse when it has been already computed.
cacheSolve <- function(x, ...) {
    i <- x$getinv()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
    i
}
