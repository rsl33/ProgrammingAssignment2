## Put comments here that give an overall description of what your
## functions do
#rsl--
#This pair of functions create an invertible "matrix" object (assumed square & nonsingular)
#and then computes its inverse and stores the inverse to cache for repeated use to save recomputation.
#Using the scoping rules of R the <<- operator is used to obtain an initial value from and cache
#the result to an environment different from the current environment.

## Write a short comment describing this function
#The function makeCacheMatrix gets the matrix to invert from another environment
# and creates four functions to 
#1. set the value of the matrix
#2. get the value of the matrix
#3. set the value of the inverse
#4. get the value of the inverse
# makeCacheMatrix returns a list of the functions

#makeCacheMatrix <- function(x = matrix()) {

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## Write a short comment describing this function
#cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
##rsl--
## CacheSolve first checks if x(inv) is (strored in cache and that 
#the remote matrix y has not changed), if true, cacheSolve gets x(inv)
#from cache and returns it as m; else cacheSolve gets the new value of x and 
#recomputes #x(inv), saves the new value to cache and returns x(inv) as m.  

  cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    x<<-y
    if(!is.null(m) & identical(x,y)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
  }



