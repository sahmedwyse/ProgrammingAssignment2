#--------------------------------------------------------------------
# Test function to demonstrate cacheMatrix.
#--------------------------------------------------------------------
TestCacheMatrix <- function(x)
{
    source("makeCacheMatrix.R")                   # To obtain make/cache of our function.

    library("Matrix")                             # To create Matrix and Hilbert.
    
    mat <- Matrix(1:x*x, x, x)                    # 10x10 matrix with 1's on diagonal
    for (i in 1:x) mat[i, i] = 1
    matX <- makeMatrix(mat)                       # our cachesolve requires an embedded matrix
                                                  # so that its getter and setter will work
    matInv <- cachesolve(matX)                    # Calculate inverse of mat
    print(sprintf("-------------------------------Inverse of %dx%d matrix is:", x, x))
    print(matInv)
    print(sprintf("-------------------------------Inverse of %dx%d matrix is: (again)", x, x))
    matInv2 <- cachesolve(matX)
    print(matInv2)
    
    #--------------------------------------------(Hilbert matrix test)
    hil <- Hilbert(x)
    hilX <- makeMatrix(hil)                       # Our cachesolve requires an embedded matrix
    hilInv <- cachesolve(hilX)                    # Calculate inverse of mat
    print(sprintf("-------------------------------Inverse of %dx%d HILBERT is:", x, x))
    print(hilInv)
    print(sprintf("-------------------------------Inverse of %dx%d HILBERT is: (again)", x, x))
    hilInv2 <- cachesolve(hilX)
    print(hilInv)
}
