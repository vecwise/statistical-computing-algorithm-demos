#1.----------------------------
data = rexp(100000,1)
X = data[which(data>10)]
mean(X)

#2.----------------------------
data2 = rexp(100000,0.1)
X = data2[which(data2>10)] #©âh(X)
Y = X * (exp(-X)/exp(-10)) / (0.1*exp(-0.1*X)/exp(-1))
mean(Y)



sd(Y)


hist(Y)



19*exp(-100)-18*exp(-10)

exp(10)

10*(1000/1.9+200/1.9^2+20/1.9^3-121)*exp(1)
