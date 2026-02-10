#q1
lambda = function(t) 3+4/(1+t)
nohopoi_sim = function(lambda,T){
  t = 0
  lambda_ini = 7
  X = numeric()
  while(1==1){
    u = runif(1)
    t = t-log(u)/lambda_ini
    if(t>T) {break}
    if(runif(1)<lambda(t)/lambda_ini){
      X = c(X,t) 
    }
  }
  return(X) 
}

T = 10
X = nohopoi_sim(lambda,T)
plot(X,xlab = "event_number",ylab = "t")

#q2
library(ggplot2)
n = 10000
X1 = rep(0,n)
X2 = rep(0,n)
X3 = rep(0,n)
corrr = matrix(c(1,0.5/2,0.5/3,0.5/2,1,0.5/6,0.5/3,0.5/6,1),3,3)
covvv = matrix(c(1,0.5,0.5,0.5,1,0.5,0.5,0.5,1),3,3)
A = chol(corrr) #Cholesky decomposition

for(i in c(1:n)){
  Z = cos(2*pi*runif(3))*sqrt(-2*log(runif(3))) #Normal(0,1)
  W = t(A) %*% Z #W ~ N(0,Cov(X))
  phi = pnorm(W) #Gaussian copula
  X1[i] = qexp(phi[1],rate = 1) #inverse
  X2[i] = qexp(phi[2],rate = (1/2))
  X3[i] = qexp(phi[3],rate = (1/3))
}
data2 = cbind(X1,X2,X3)
cov(data2)
