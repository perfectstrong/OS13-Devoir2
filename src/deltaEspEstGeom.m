close all;
p=1/10;
n=10.^(1:0.2:4);
delta_esp_est=zeros(1,length(n));
for i=1:length(n)
  esp_p_est=0;
  for k=1:100
    Y=geomGen(n(i),p);
    esp_p_est += n(i)/sum(Y);
  endfor
  esp_p_est/=k;
  delta_esp_est(i) = abs(esp_p_est - p);
  i++;
endfor
plot(log10(n),delta_esp_est);
title('Evolution du biais moyen de p_{est}');
xlabel('log10(n)');
ylabel('|p_{est} - p|');