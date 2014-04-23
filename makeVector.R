makeVector <- function( x = numeric() ) {
        
        #Initialize matrix
        m <- NULL
        
        # set value of vector
        set <- function( y ) {
                x <<- y
                m <<- NULL
        }
        
        # get value of vector
        get <- function() x
        
        # set value of mean
        setmean <- function(mean) m <<- mean
        
        # get value of mean
        getmean <- function() m
        
        list( set = set, get = get, setmean = setmean, getmean = getmean)
        
}