set.seed(2018)
N = 10000
m = 30
n = 70
k = 50
x = rhyper(N, m, n, k)
hist(x,
     col = "cyan",
     freq = F,
     breaks = 10,
     main = "Histogramme et approximation par la loi hypergéométrique")
curve(dhyper(x, m, n, k),
      add = TRUE,
      col = "darkblue",
      from = min(x),
      to = max(x),
      n = max(x) - min(x) + 1)