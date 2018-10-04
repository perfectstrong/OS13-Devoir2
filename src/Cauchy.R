# fixer le gemme et paramètres réels
set.seed(2018)
real_x0 = 13
real_a = 0.5
nbreaks = 40

# générér échantillons
N = 1000
x = rcauchy(n = N,
            location = real_x0,
            scale = real_a)

# définir fonction log négative pour MLE
ll = function(location, scale) {
    dist = suppressWarnings(dcauchy(x,
                                    location,
                                    scale,
                                    log = TRUE))
    -sum(dist)
}

# MLE (Maximum Likelihood Estimator)
library(stats4)
hat_x0 = median(x)
d = hist(x,
         breaks = nbreaks,
         plot = FALSE) # histogram
hat_a = 1 / (pi * max(d[["density"]]))
result = mle(ll,
             start = list(location = hat_x0, scale = hat_a))

# illustrer
hist(x,
     freq = F,
     breaks = nbreaks,
     col = "green",
     xlab = "x",
     ylab = "Densité",
     ylim = c(0, 0.2),
     main = "Loi de Cauchy - réalité vs théorique") # histogram
curve(dcauchy(x, real_x0, real_a),
      add = TRUE,
      col = "black") # theoretic
curve(dcauchy(x, result@coef[1], result@coef[2]),
      add = TRUE,
      col = "red") # calculated
legend("topright",
       legend = c("histogramme", "théorique", "réalité"),
       fill = c("green", "black", "red"))

ks.test(x, "pcauchy", real_x0, real_a)