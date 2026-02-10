



X = seq(from=0.01,to=0.89,by=0.11)
failtimes = rep(0,1000)
for (i in 1:1000){
  I = floor(9*runif(1)) + 1
  y = runif(1)
  X[I] = y
  delta = abs(y-X)
  while(sum(delta>=0.1)!=8){
    y = runif(1)
    X[I] = y
    delta = abs(y-X)
    failtimes[i] = failtimes[i] + 1
  }
}
cat("One sample is", sort(X))
cat("Mean of failtimes is", mean(failtimes))
