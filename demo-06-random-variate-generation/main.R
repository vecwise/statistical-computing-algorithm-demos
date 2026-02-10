#1.---------------------------------------------
  #a.Inverse Method ####################
n = 10000
U = runif(n)
dist1 = -1+sqrt(8*U+1)/2
hist(dist1,probability = T)

  #b.Rejection Method ####################
n = 10000
X=as.numeric()
for (i in 1 : n){
  U1 = runif(1)
  U2 = runif(1)
  Y1 = (1/3)+(2/3)*U1
  if (U2<=Y1) {X[i] = U1}
  X = X[!is.na(X)]
  if (length(X)== n ) {break}
}
hist(X,probability = T)
  
  #c.Composition Method ####################
n = 10000
X=as.numeric()
for(i in 1:n){
  U3 = runif(1)
  U4 = runif(1)
  if (U3<0.5) X[i]=sqrt(U4)
  else X[i]=U4
}
hist(X,probability = T)

#2.---------------------------------------------
  #a. ####################
U1 = runif(n)
U2 = runif(n)
X1 = -log(U1)
X2 = -log(U2)/2
X = X2*(X1<=X2)+X1*(X1>X2)
hist(X,probability = T)


  #b. Acceptance Rejection Method ####################
fun1 = function(x) exp(-0.01*x)
fun2 = function(x) exp(-x)+2*exp(-2*x)-3*exp(-3*x)
X = as.numeric()
for (i in 1 : n){
  U1 = runif(1)
  U2 = runif(1)
  if (U1<=fun2(U2)/fun1(U2)) {X[i]=U2}
  X = X[!is.na(X)]
  if (length(X)==n) {break}
}
hist(X,probability = T)
curve(fun2,add=T,col='blue')


#3.---------------------------------------------
  #a.Acceptance Rejection Method ####################
f = function(x) {(1/4)+2*x^(3)+(5/4)*x^(4)}
X=as.numeric()
for (i in 1:n){
  U1<-runif(1)
  U2<-runif(1)
  if (U2<=f(U1)/3.5) {X[i]=U1}
  X = X[!is.na(X)]
  if (length(X)==n) {break}
}
hist(X,probability = T)

  #b.Composition Method ####################
n = 10000
X = as.numeric()
for(i in 1:n){
  U1 = runif(1)
  U2 = runif(1)
  if (U2<0.25) X[i] = U1
  else if (U2<0.75) X[i] = U1^(1/4)
  else X[i] = U1^(1/5)
}
hist(X,probability = T)







