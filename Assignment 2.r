
ishita padharia
1:58 PM (5 hours ago)
to me

## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly

## Below are the pair of functions that cache the inverse of a matrix.

 

 

## This function creates a special "matrix" object that can cache its inverse.

## set the value of the matrix

## get the value of the matrix

## set the value of the inverse

## get the value of the inverse

 

makeCacheMatrix <- function(x = matrix()) {

                  inverse <- NULL

        set <- function(y) {

                x <<- y

                inverse <<- NULL   

        }

        get <- function() x

        setInverse <- function(solve) inverse <<- solve

        getInverse <- function() inverse

        list(set = set, get = get,

             setInverse = setInverse,

             getInverse = getInverse)

 

}

 

 

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

 

cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'

                  inverse <- x$getInverse()

        if(!is.null(inverse)) {

                message("getting cached data")

                return(inverse)

        }

        matrix <- x$get()

        inverse <- solve(matrix, ...)

        x$setInverse(inverse)

        inverse

 

}