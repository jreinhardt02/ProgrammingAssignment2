source("cachematrix.R")
a <- matrix( c(5,1,0,3,-1,2,4,0,-1), nrow=3, byrow=TRUE)
a
i <- makeCacheMatrix(a)
j <- cacheSolve(i)  
j  ##display inverse matrix
i$set(j)
cacheSolve(i)   ## display reversal of inverse
cacheSolve(i)   ## display reversal of inverse from cache