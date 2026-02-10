set.seed(42)

save_png <- function(path, expr, width = 900, height = 560) {
  png(path, width = width, height = height)
  par(
    mar = c(4.2, 4.4, 2.8, 1.2),
    bg = "#f8fbff",
    col.axis = "#334155",
    col.lab = "#334155",
    col.main = "#0f172a",
    cex.axis = 1.05,
    cex.lab = 1.1,
    cex.main = 1.2
  )
  eval(expr)
  dev.off()
}

apply_preview_theme <- function() {
  grid(col = "#dbeafe", lty = 1, lwd = 1)
  box(col = "#cbd5e1")
}

main_title <- function(n, label) sprintf("Demo %02d  |  %s", n, label)

# Demo 01: MM1 waiting time histogram
save_png("demo-01-mm1-cutoff-bootstrap/preview.png", quote({
  w <- rexp(1200, rate = 0.35)
  hist(w, breaks = 35, col = "#93c5fd", border = "white", main = main_title(1, "Waiting Time"), xlab = "time in system")
  apply_preview_theme()
  abline(v = mean(w), col = "#dc2626", lwd = 2)
}))

# Demo 02: variance reduction comparison
save_png("demo-02-mm1-variance-reduction/preview.png", quote({
  naive <- rgamma(300, shape = 8, rate = 0.8)
  anti <- naive + rnorm(300, 0, 0.8)
  cv1 <- naive + rnorm(300, 0, 0.6)
  cv2 <- naive + rnorm(300, 0, 0.55)
  cond <- naive + rnorm(300, 0, 0.5)
  boxplot(naive, anti, cv1, cv2, cond,
          names = c("Naive", "Anti", "CV1", "CV2", "CondE"),
          col = c("#f9c74f", "#90caf9", "#95d5b2", "#f7a399", "#80cbc4"),
          main = main_title(2, "Estimator Dispersion"), ylab = "estimate")
  apply_preview_theme()
}))

# Demo 03: IS weights
save_png("demo-03-rare-event-importance-sampling/preview.png", quote({
  x <- rexp(8000, rate = 0.1)
  w <- dexp(x, rate = 1) / dexp(x, rate = 0.1)
  y <- (x > 10) * w
  hist(y, breaks = 40, col = "#7dd3fc", border = "white", main = main_title(3, "IS Weighted Samples"), xlab = "weighted indicator")
  apply_preview_theme()
}))

# Demo 04: NHPP event times
save_png("demo-04-nhpp-gaussian-copula/preview.png", quote({
  lambda <- function(t) 3 + 4 / (1 + t)
  T <- 10
  lam_max <- 7
  t <- 0
  x <- numeric()
  while (TRUE) {
    t <- t - log(runif(1)) / lam_max
    if (t > T) break
    if (runif(1) < lambda(t) / lam_max) x <- c(x, t)
  }
  plot(seq_along(x), x, pch = 19, col = "#0284c7", main = main_title(4, "NHPP Event Times"), xlab = "event index", ylab = "time")
  apply_preview_theme()
}))

# Demo 05: constrained points
save_png("demo-05-constrained-uniform-mcmc/preview.png", quote({
  x <- seq(0.01, 0.89, by = 0.11)
  for (i in 1:500) {
    I <- sample.int(9, 1)
    repeat {
      y <- runif(1)
      if (all(abs(y - x[-I]) >= 0.1)) {
        x[I] <- y
        break
      }
    }
  }
  x <- sort(x)
  plot(x, rep(1, length(x)), pch = 19, cex = 2, xlim = c(0, 1), ylim = c(0.9, 1.1),
       yaxt = "n", xlab = "x", ylab = "", main = main_title(5, "Feasible Configuration"))
  apply_preview_theme()
  segments(0, 1, 1, 1, lty = 2, col = "#64748b")
}))

# Demo 06: inverse transform sample
save_png("demo-06-random-variate-generation/preview.png", quote({
  u <- runif(5000)
  x <- (-1 + sqrt(1 + 8 * u)) / 2
  hist(x, probability = TRUE, breaks = 40, col = "#b8f2e6", border = "white",
       main = main_title(6, "Inverse Transform"), xlab = "x")
  apply_preview_theme()
  curve((1 + 2 * x) / 2, from = 0, to = 1, add = TRUE, col = "#dc2626", lwd = 2)
}))

# Demo 07: poisson trend posterior grid
save_png("demo-07-bayes-poisson-trend-grid/preview.png", quote({
  y <- c(24,25,31,31,22,21,26,20,16,22)
  x <- 1:10
  a_seq <- seq(3.0, 3.7, length.out = 90)
  b_seq <- seq(-0.10, 0.05, length.out = 90)
  z <- outer(a_seq, b_seq, Vectorize(function(a, b) {
    lam <- exp(a + b * x)
    sum(dpois(y, lam, log = TRUE))
  }))
  z <- exp(z - max(z))
  image(a_seq, b_seq, z, col = hcl.colors(24, "YlOrRd", rev = TRUE),
        xlab = expression(alpha), ylab = expression(beta),
        main = main_title(7, "Posterior Grid"))
  contour(a_seq, b_seq, z, add = TRUE, drawlabels = FALSE, col = "#334155")
}))

# Demo 08: hierarchical tau posterior
save_png("demo-08-bayes-hierarchical-grid-posterior/preview.png", quote({
  y <- c(0.028,-0.741,-0.541,-0.246,0.069,-0.584,-0.512,-0.079,-0.424,-0.335,-0.213,-0.039,-0.593,0.282,-0.321,-0.135,0.141,0.322,0.444,-0.218,-0.591,-0.608)
  s <- c(0.85,0.483,0.565,0.138,0.281,0.676,0.139,0.204,0.274,0.117,0.195,0.229,0.425,0.205,0.298,0.261,0.364,0.553,0.717,0.26,0.257,0.272)
  tt <- seq(0.001, 1.5, length.out = 500)
  p_tau <- sapply(tt, function(tau) {
    w <- 1/(s^2 + tau^2)
    mu <- sum(y * w) / sum(w)
    val <- (sum(w))^(-0.5) * prod((s^2 + tau^2)^(-0.5) * exp(-0.5 * (y - mu)^2/(s^2 + tau^2)))
    val
  })
  p_tau <- p_tau / sum(p_tau)
  plot(tt, p_tau, type = "l", lwd = 2, col = "#0d9488", xlab = expression(tau), ylab = "density",
       main = main_title(8, "Marginal Posterior of tau"))
  apply_preview_theme()
}))

# Demo 09: ARMA-GARCH series
save_png("demo-09-ts-arma-garch-simulation/preview.png", quote({
  n <- 200
  r <- a <- numeric(n)
  sig2 <- rep(1, n)
  eps <- rnorm(n)
  for (i in 3:n) {
    sig2[i] <- 0.01 + 0.12 * a[i-1]^2 + 0.09 * sig2[i-1]
    a[i] <- sqrt(sig2[i]) * eps[i]
    r[i] <- 0.01 + 0.03 * r[i-1] - 0.03 * r[i-2] + a[i]
  }
  plot(r, type = "l", col = "#0f766e", lwd = 1.4, main = main_title(9, "Simulated Return Series"), xlab = "t", ylab = "r_t")
  apply_preview_theme()
}))

# Demo 10: Brownian paths and barrier
save_png("demo-10-ts-brownian-passage-prob/preview.png", quote({
  m <- 400
  tt <- seq(1/m, 1, length.out = m)
  mat <- replicate(30, cumsum(rnorm(m, sd = 1/sqrt(m))))
  matplot(tt, mat, type = "l", lty = 1, col = rgb(0.2, 0.4, 0.7, 0.25),
          xlab = "t", ylab = "W(t)", main = main_title(10, "Brownian Paths"))
  apply_preview_theme()
  abline(h = -3, col = "#dc2626", lwd = 2, lty = 2)
}))
