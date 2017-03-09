

## Similar to makeVector.R , just changing argument numeric() to matrix() 
## and renaming inverseMatrix to the variable m. 

makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <- NULL

  set <- function(y){
    x <<- y
    inverseMatrix <<- NULL
  }
  
  get <- function(){
    x
  }
  
  setInverse <- function(inverse){
    inverseMatrix <<- inverse
  }
  
  getInverse <- function(){
    inverseMatrix
  }
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  
}


##Similar to cachemean.R , just changing mean function to Solve in order to get the Inverse Matrix


cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  inverseMatrix <- x$getInverse()
  if(!is.null(inverseMatrix)) {
    message("getting cached data")
  return(inverseMatrix)
  }
  data <- x$get()
  inverseMatrix <- solve(data)
  x$setInverse(inverseMatrix)
  return(inverseMatrix)
  }
