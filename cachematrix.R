## The first function, makeVector creates a special "vector", which is really a list containing a function to

## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean

##  This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
            inv <- NULL
            set <- function(y) {
                      x <<- y
                      inv <<- NULL
                  }
            get <- function() x
            setinverse <- function(inverse) inv <<- inverse
            getinverse <- function() inv
            list(set = set, get = get,
                                            setinverse = setinverse,
                                            getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                 inv <- x$getinverse()
        ## Check if the inverse is already calculated
                 if(!is.null(inv)) {
                               message("getting cached data")
                               return(inv)
                           }
                 data <- x$get()
                 inv <- solve(data, ...)
                 x$setinverse(inv)
                 inv
        
}
