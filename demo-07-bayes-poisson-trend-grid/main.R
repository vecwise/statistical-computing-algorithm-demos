library(ggplot2)
library(magrittr)
library(kableExtra)
library(gridExtra)

#2.e.----------------------------------------------------
alpha = 9; beta = 50
n = 10
y = c(0.25,0.50,0.62,0.92,0.98,1.00,1.07,1.10,1.20,1.48)

#Confidence interval
LB = qgamma(0.025,shape = n+alpha,rate = sum(y^2)+beta)
UB = qgamma(0.975,shape = n+alpha,rate = sum(y^2)+beta)

poster.mean = (n+alpha)/(sum(y^2)+beta)
poster.var = (n+alpha)/(sum(y^2)+beta)^2
poster.table = matrix(c(poster.mean,poster.var,"(0.192, 0.478)"))
rownames(poster.table) = c("Post.mean", "Post.var", "95% CI")
colnames(poster.table) = "Value"
poster.table

x = seq(0,0.7,by = 0.01)
densi = as.numeric()
for (i in 1:length(x)){
  densi[i] = dgamma(x[i],shape = n + alpha,rate = sum(y^2) + beta)
}

#plot
plot(x,densi)
abline(v = LB)
abline(v = UB)





  #3.----------------------------------------------------
Fatel_accidents = c(24,25,31,31,22,21,26,20,16,22)
Passenger_deaths = c(734,516,754,877,814, 362,764,809,223,1066)
Death_rate = c(0.19,0.12,0.15,0.16,0.14,0.06,0.13,0.13,0.03,0.15)
data = data.frame(Year = seq(1976,1985)-1975,Fatel_accidents,Passenger_deaths,Death_rate)
  #e.--------------------------------------------------------
lme = lm(log(Fatel_accidents) ~ Year,data = data)
plot(data$Year, log(data$Fatel_accidents) )
abline(lme)
  #f.--------------------------------------------------------
n = 10
m = 100
# posterior dist.
posterior = function(alpha,beta){
  y = data$Fatel_accidents
  x = data$Year
  lambda = exp(alpha + (beta * x))
  value = sum(( (y * log(lambda))
                - lambda - log(factorial(y))))
  value = exp(value)
  return(value)
}

alpha.seq = seq(3, 3.7, length.out = m)
beta.seq = seq(-0.10, 0.05, length.out = m)
jpdensi = data.frame(alpha = rep(alpha.seq,each = m),
                     beta = rep(beta.seq,times = m))
jpdensi$density =apply(jpdensi,1,
                       FUN = function(x){posterior(alpha = x[1], beta = x[2])})
# plot
poster_contour = ggplot(data = jpdensi,aes(x = alpha, y = beta)) +
  geom_raster(aes(fill = density), interpolate = TRUE) +
  geom_contour(aes(z = density), colour = "black", size = 0.3) +
  scale_fill_gradientn(colours = c("white", "yellow", "blue")) +
  labs(title = "Posterior density",
       x = expression(alpha), y = expression(beta),
       caption = "Contours plot")
poster_contour
  #f.cont.--------------------------------------------------------------------
#Sampling from posterior dist.
nsample = 1000 # sampling number
index = sample(1:m^2,
               size = nsample, replace = TRUE,
               prob = jpdensi$density)
# plot joint dist
joint.dist = ggplot(data = jpdensi[index, ],
                    aes(x = alpha, y = beta)) +
  geom_point() +
  labs(x = expression(alpha), y = expression(beta),
       title = "Sampling form joint posterior dist.")
joint.dist
  #g.--------------------------------------------------------
dpredict = exp((jpdensi[index,1]+(11*jpdensi[index,2])))
# plot
plotdpredict = ggplot(data = NULL, aes(x = dpredict)) +
  geom_histogram(aes(y = ..density..),binwidth = 0.4,fill = 'light blue', color = 'black') +
  geom_density(aes(y = ..density..)) +
  labs(x = '#', title = "Poeterior density of # of fatal accidents")
plotdpredict
  #h.--------------------------------------------------------
y.predict = as.numeric()
for (i in 1:1000) {y.predict[i] = rpois(1,lambda = dpredict[i])}

#Confidence Interval
y.info.table = c(sort(y.predict) %>% .[25],
                 sort(y.predict) %>% .[975]) 
y.info.table = data.frame(y.info.table,row.names = c("95%_LCI", "95%_UCI"))
colnames(y.info.table) = "Value"
#plot
plotypredict = ggplot(data = NULL, aes(x = y.predict)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 1,
                 fill = 'light blue', color = 'black') +
  geom_density()+labs(title = bquote("Distribution"))
plotypredict
