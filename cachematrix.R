## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix 
        ## Creates an object of type makeCacheMatrix containing 
        ## its functions and environment
                ## set 
                        ## reset the environment variables for new run
                ## get
                        ## returns the current value of x matrix
                ## setSolve
                        ## sets the inverse into m
                ## getSolve 
                        ## returns the curent value of m
        ## instantiate with matrixCacheObject <- makeCacheMatrix(matrixData)
        ## reset the matrixData with matrixCacheObect$set(newMatrix)
        ## get what is in the current matrix with matrixCacheObject$get
        ## set the inverse matrix with matrixCacheObject$getSolve()
        ## see what is in the inverse matrix with matrixCacheObject$getSolve()
     


## defines an object to allow caching of a matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setSolve <- function(solve) m <<- solve
        getSolve <- function() m
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)
        
}




## CacheSolve 
## Uses an object of type makeCacheMatrix containing
## its functions and environment to calculate the inverse
## loads the inverse into memory for later use when used many times.
## x is an object of type makeCacheMatrix

## Sample test case
## source("cachematrix.R")   ## load source
## a <- matrix( c(5,1,0,3,-1,2,4,0,-1), nrow=3, byrow=TRUE)  ## Create a matrix
## a      ## display the matrix
## i <- makeCacheMatrix(a)   ## Instantiate the object with data
## j <- cacheSolve(i)        ## solve inverse
## j  ##display inverse matrix  ## display inversse
## i$set(j)                     ## reset data to new matrix (using inverse)
## cacheSolve(i)   ## calc and display reversal of inverse should match original
## cacheSolve(i)   ## display reversal of inverse from cache


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getSolve()
        if(!is.null(m)) {
                message("getting cached matrix data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
