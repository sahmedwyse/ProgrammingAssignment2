#--------------------------------------------------------------------
# Following the steps in makeVector() and cachemean()
# Renamed variables to reflect matrix and solve().
#--------------------------------------------------------------------
makeMatrix <- function(mat = numeric()) {
    sol <- NULL
    set <- function(y) {
        mat <<- y                # New matrix is used. 
        sol <<- NULL             # So set sol to null.
    }
    get <- function() mat
    setsolve <- function(solve) sol <<- solve
    getsolve <- function() sol
    list(set = set, get = get,   # Wish someone explained this step.
         setsolve = setsolve,
         getsolve = getsolve)
}
#--------------------------------------------------------------------
cachesolve <- function(mat, ...) {
    sol <- mat$getsolve()
    if(!is.null(sol)) {          # Non-null sol found.
        message("getting cached data")
        return(sol)
    }
    data <- mat$get()
    sol <- solve(data, ...)      # Fresh solve() invoked.
    mat$setsolve(sol)
    sol
}
#--------------------------------------------------------------------
