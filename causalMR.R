## Written by Ruilin Li 
## ruilinli@stanford.edu
## Rivas and Tibshirani Labs
## 02.12.2020


soft_thresh = function(x, thresh){
  sign(x)*(pmax(0, abs(x) - thresh))
}

converged = function(x, y, x_prev, y_prev, eps){
  x_converge = max(abs(x-x_prev)) < eps
  y_converge = max(abs(y - y_prev)) < eps
  return(x_converge & y_converge)
}

# multi-variate case
prox_grad = function(a, b, C,lambda, t=0.01, x=NULL, y=NULL, eps=0.0001){
  J = length(a)
  # Some preprocessing
  if (is.null(x)){x = rep(0, J)}
  if (is.null(y)){y = rep(0,dim(C)[2])}
  
  # pre-compute C^TAC
  cac = sweep(C, 1, sqrt(a), FUN="*")
  cac = crossprod(cac)

  while(TRUE){
    x_prev = x
    y_prev = y
    dy = 2*cac %*% y - 2* t(C) %*% (a*(b-x))
    dx = 2*a*x - a*(b - C%*%y)
    x = soft_thresh(x - t*dx, t*lambda)
    y = y  - t*dy
    
    if(converged(x, y, x_prev, y_prev, eps)){break}
  }
  return(list(theta0=x,  thetaL=y))
}

wrapper = function(se, beta_Y, beta_X, lambda, t=0.01, x=NULL, y=NULL, eps=1e-7){
  prox_grad(1/(se^2), beta_Y, as.matrix(beta_X),lambda, t, x, y, eps)
}
