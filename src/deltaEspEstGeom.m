close all;
p=1/10;
n=10.^(1:0.2:3);%more is too much
%n=10.^(1:0.01:2);
delta_moy_est=zeros(1,length(n));
for i=1:length(n)
  moy_p_est=0;
  for k=1:500
    Y=geomGen(n(i),p);
    moy_p_est += n(i)/sum(Y);
  endfor
  moy_p_est/=k;
  delta_moy_est(i) = (moy_p_est-p)/p;
  i++;
endfor
plot(log10(n),delta_moy_est);
title('Evolution écart moyen de p_{est}');
xlabel('log10(n)');
ylabel('Moy((p_{est} - p)/p)');
