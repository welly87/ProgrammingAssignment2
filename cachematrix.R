## This functions will give the matrix cache object

## This function willl create matrix object with setter and getter, and cache the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        get <- function() x
        
        setinverse <- function(inverse) m <<- inverse
        
        getinverse <- function() m
        
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function will caculate the inverse if not cached yet and return the calculation from the cache object

cacheSolve <- function(x) {
        m <- x$getinverse()
        
        if(!is.null(m)) { # data has already in cache
                message("getting cached data")
                return(m)
        }
        
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
