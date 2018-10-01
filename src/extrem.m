close all;
p=1/10;
n=1000;
i=1;
for M=[10 100 1000]
  for m=1:10
    Y=geomGen(n,p);
    sort(Y);
    Z((m-1)*(n/100)+1:m*(n/100))=Y((99*n)/100+1:n);
  endfor
  subplot(3,1,i);
  i++;
  hist(Z,100*i);
endfor