close all;

p=0.1; %probability to win
pop1 = geomGen(50,p);
pop2 = geomGen(500,p);
pop3 = geomGen(5000,p);
k=1:max(pop3)+1;
distrib = (1-p).^k.*p;
subplot(221);
hist(pop1,k,1);
xlabel('k');
ylabel('Freq(k)');
title('Histogramme de 50 variables');
subplot(222);
hist(pop2,k,1);
xlabel('k');
ylabel('Freq(k)');
title('Histogramme de 500 variables');
subplot(223);
hist(pop3,k,1);
xlabel('k');
ylabel('Freq(k)');
title('Histogramme de 5000 variables');
subplot(224);
bar(k,distrib);
xlabel('k');
ylabel('P(X=k)');
title('Distribution théorique géomètrique');

p1 = 10/sum(pop1);
[max1 p1_bis] = max((10.*log(0.001:0.001:0.999))+(sum(pop1)-10).*log(0.999:-0.001:0.001));
p1_bis = 0.001 + 0.001*p1_bis;
p2 = 100/sum(pop2);
[max2 p2_bis] = max((100.*log(0.001:0.001:0.999))+(sum(pop2)-100).*log(0.999:-0.001:0.001));
p2_bis = 0.001 + 0.001*p2_bis;
p3 = 1000/sum(pop3);
[max1 p3_bis] = max((1000.*log(0.001:0.001:0.999))+(sum(pop3)-1000).*log(0.999:-0.001:0.001));
p3_bis = 0.001 + 0.001*p3_bis;