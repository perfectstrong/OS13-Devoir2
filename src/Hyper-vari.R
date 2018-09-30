#abc
set.seed(2018)
N = 10000
m = 30
n = 70
k = 10
x = rhyper(N, m, n, k)
d = dhyper(x, m, n, k)
plot(NULL, NULL,
     type = "n",
     main = "Courbes de densité dépendant de k",
     xlab = "Univers",
     ylab = "Densité",
     col = "red",
     xlim = c(0, m),
     ylim = c(0, 0.4)
     )
ck = seq.int(10, 90, 10)
couleurs = rainbow(n = length(ck))
for (k in ck) {
    x = rhyper(N, m, n, k)
    curve(dhyper(x, m, n, k),
          add = TRUE,
          col = couleurs[k / 10],
          from = min(x),
          to = max(x),
          n = max(x) - min(x) + 1)
}
legend("top",
       legend = ck,
       col = couleurs,
       lty = 1,
       ncol = 3
       )