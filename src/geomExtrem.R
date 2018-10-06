#on charge le package Mass
library(MASS);

# z contient les données extremum de loi géomètrique

z<-dataZ041018[1:10000,1];

# on utilise la fonction fitdistr pour une loi Weibull et une loi lognormal

paraw <- fitdistr(z,densfun="weibull");
logLik(paraw)  # on peut avoir le loglikelihood
paral <- fitdistr(z, densfun="log-normal");
logLik(paral)  # on peut avoir le loglikelihood

# on visualise les résultats sur un graphique : histogramme+ loi 

# histogramme
hist(z,
     freq = F,
     breaks = 100,
     col = "green",
     xlab = "Extremum",
     ylab = "Densité",
     main = "Loi d'extremum, cas géométrique p=0.1"
);# penser à freq=FALSE!!
lines(dweibull(0:max(z),shape=paraw$estimate[1],scale=paraw$estimate[2]),type='l',col='blue',lwd=2);
lines(dlnorm(0:max(z),meanlog = paral$estimate[1],sdlog=paral$estimate[2]),type='l',col='red',lwd=2);
legend(80, 0.04, legend=c("Loi de Weibull estimée","Loi Log-normale estimée"),col=c("blue", "red"), lty=2, cex=0.8);

