## Put comments here that give an overall description of what your functions do?
## Two functions that cache the inverse of a matrix.


## Write a short comment describing this function?
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        a <- NULL
        set <- function(y) {
                x <<- y
                a <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) a <<- solve
        getsolve <- function() a
        list(set = set, get = get,
                setsolve = setsolve,
                getsolve = getsolve)
}


#############################################################################################################################

## Write a short comment describing this function?
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
cacheSolve <- function(x, ...) {
        a <- x$getsolve()
        if(!is.null(a)) {
                message("getting cached data")
                return(a)
        }
        data <- x$get()
        a <- solve(data, ...)
        x$setsolve(a)
		## Return a matrix that is the inverse of 'x'
        a
}