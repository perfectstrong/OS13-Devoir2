# fixer les paramètres réels
set.seed(2018)
real_x0 = 13
real_a = 0.5
minN = 1000
numN = 100
delta = 500
maxN = minN + (numN - 1) * delta
pickupNum = 3
results = rep(NA, 3000) # à contenir tous les résultats
countResults = 0

for (i in 1:numN) {
    N = minN + (i - 1) * delta

    # générér échantillon
    x = rcauchy(n = N,
                location = real_x0,
                scale = real_a)

    # trier
    sort(x, decreasing = TRUE) # dans l'ordre décroissant

    # tirer
    extremes = head(x, pickupNum)
    for (j in 1:length(extremes))
        results[countResults + j] = extremes[j]
    countResults = countResults + length(extremes)
}

# histogramme
hist(results,
     freq = F,
     breaks = 100,
     col = "green",
     xlab = "Extremum",
     ylab = "Densité",
     main = "Loi d'extremum au cas de Cauchy"
     )

results = na.omit(results) # filtrer les NA
library(poweRlaw)
positiveResults = results[which(results > 0)] # filtrer les négatifs
cauchy_pl = conpl$new(positiveResults) # objet de calculer la loi d'extremum
est = estimate_xmin(cauchy_pl) # estimer la borne inférieure
cauchy_pl$setXmin(est) # mettre à jour l'objet de distribution
plot(cauchy_pl, col = "green")
lines(cauchy_pl, col = "red")
bs_p = bootstrap_p(cauchy_pl) # tester l'estimation
bs_p$p