## write an R function is able to cache potentially time-consuming computations

## The first function, `makeCacheMatrix` creates a special "vector", which is really a list containing a function to 
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function( x = matrix() ) {
        
        #Initialize matrix
        m = NULL
        
        #set value of matrix
        set <- function( y ) {
                x <<- y
                m <<- NULL
        }
        
        # get value of matrix
        get <- function() x
        
        # set the inverse of matrix
        setinverse <- function(solve) m <<- solve
        
        # get value of the inverse
        getinverse <- function() m

        list( set = set, get = get, setmean = setmean, getmean = getmean)
        
}


## The following function calculates the mean of the special "vector" created with the above function. 
## However, it first checks to see if the mean has already been calculated. 
## If so, it `get`s the mean from the cache and skips the computation. 
## Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the `setmean` function.

cacheSolve <- function( x, ... ) {
        
        #get value of inverse
        m <- x$getinverse()
        
        #check to see if inverse is already computed
        if( !is.null( m ) ) {
                message("getting cached data")
                
                #if inverse is cached, get the cached value and return
                return( m )
                
        }
        
        #otherwise calculates inverse of data
        matrix <- x$get()
        m <- solve(matrix, ...)
        
        #set mean to cached value
        x$setinverse(m)
        
        ## Return a matrix that is the inverse of 'x'
        m
}
