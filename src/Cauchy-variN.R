library(stats4)
# définir fonction log négative pour MLE
ll = function(location, scale) {
    dist = suppressWarnings(dcauchy(x,
                                    location,
                                    scale,
                                    log = TRUE))
    - sum(dist)
}   

# fixer les paramètres réels
set.seed(2018)
real_x0 = 13
real_a = 0.5
nbreaks = 40
minN = 100
numN = 40
delta = 25
maxN = minN + (numN - 1) * delta

Ns = seq.int(minN, maxN, delta) # tous 40 valeurs de n de 100 à 1000
results = array(NA, c(2, numN)) # à contenir tous les résultats

for (i in 1:numN) {
    N = minN + (i - 1) * delta

    # générér échantillon
    x = rcauchy(n = N,
                location = real_x0,
                scale = real_a)

    # MLE (Maximum Likelihood Estimator)
    hat_x0 = median(x)
    d = hist(x,
             breaks = nbreaks,
             plot = FALSE) # histogram
    hat_a = 1 / (pi * max(d[["density"]]))
    result = mle(ll,
             start = list(location = hat_x0, scale = hat_a))

    # récupérer le résultat
    results[1, i] = result@coef[1] # x_0
    results[2, i] = result@coef[2] # a
}

# illustrer
plot(x = results[1, ],
     y = results[2, ],
     col = rgb(0, 100, 0, 70, maxColorValue = 255),
     pch = 16,
     cex = 1.5,
     main = "Convergence d'estimateurs",
     xlab = "Location x_0",
     ylab = "Echelle a"
     )
points(x = real_x0,
     y = real_a,
     col = "red",
     pch = 16,
     cex = 2
     )

legend("topleft",
       legend = c("valeur théorique", "valeur estimée"),
       fill = c("red", rgb(0, 100, 0, 70, maxColorValue = 255)))