close all;
p=1/10;
n=10.^(1:0.02:4);
delta_est=zeros(1,length(n));
for i=1:length(n)
  Y=geomGen(n(i),p);
  p_est = n(i)/sum(Y);
  delta_est(i) = (p_est-p)/p;
  i++;
endfor
plot(log10(n),delta_est);
title('Evolution écart de p_{est}');
xlabel('log10(n)');
ylabel('(p_{est}-p)/p');
