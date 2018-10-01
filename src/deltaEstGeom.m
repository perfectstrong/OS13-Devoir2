close all;
i=1;
p=1/3;
n=10.^(1:0.2:4);
delta_est=zeros(1,length(n));
for i=1:length(n)
  Y=geomGen(n(i),p);
  p_est = n(i)/sum(Y);
  delta_est(i) = p_est - p;
  i++;
endfor
plot(log(n)/log(10),delta_est);
figure;

esp=0;
Z=zeros(1,1000);
for k=1:1000
  Y=geomGen(1000,p);
  p_est = 1000/sum(Y);
  Z(k)=p_est;
  esp+=p_est;
endfor
esp/=100;
hist(Z);
##espEst=0;
##  for k=1:1000
##   espEst+=geomGen(n,p);
##  end