close all;
p=1/10;
n=100;
i=1;
for M=[10 100 1000 10000]
  Z=zeros(1,M);
  for m=1:M
    Y=geomGen(n,p);
    %Y=sort(Y);
    %Z((m-1)*(n/100)+1:m*(n/100))=Y((99*n)/100+1:n);
    %Z(m)=Y(100); %take the last value
    Z(m)=max(Y);
  endfor
  subplot(2,2,i);
  i++;
  hist(Z,100*i);
  xlabel('k');
  ylabel('Freq(k)');
  title(["Histogramme des valeurs extrêmes M=" num2str(M)]);
endfor