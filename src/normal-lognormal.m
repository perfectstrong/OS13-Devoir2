close all;
%Loi normal

mus = [ 0 2 -5];
sigmas = [ 0.5 1 3 ];

x=-10:0.1:10;
f=zeros(9,length(x));
for i=1:3
    for j=1:3
      k=((i-1)*3+j);
      f(k,:) = (1/(sigmas(i)*sqrt(2*pi))).*exp(-((x-mus(j)).^2)./(2*sigmas(i)^2));
      subplot(3,3,k);
      plot(x,f(k,:));
      title(["Distribution normale N(",num2str(mus(j)),",",num2str(sigmas(i)),")"]);
      xlabel("x");
      ylabel("f(x)");
    endfor
endfor
figure;

pop1 = randn(1,10);
pop2 = randn(1,100);
pop3 = randn(1,1000);
subplot(311);
plot(x,f(4,:));
hold on;
x_pop1 = -10:1:10;
hist(pop1,x_pop1,1);
subplot(312);
plot(x,f(4,:));
hold on;
x_pop2 = -10:0.2:10;
hist(pop2,x_pop2,5);
subplot(313);
plot(x,f(4,:));
hold on;
x_pop3 = x;
hist(pop3,x,10);
figure;

%Loi log-normal

x=0.1:0.1:50;
f=zeros(9,length(x));
for i=1:3
    for j=1:3
      k=((i-1)*3+j);
      f(k,:) = (1./(x.*sigmas(i)*sqrt(2*pi))).*exp(-((log(x)-mus(j)).^2)./(2*sigmas(i)^2));
      subplot(3,3,k);
      plot(x,f(k,:));
      title(["Distribution lognormale log-N(",num2str(mus(j)),",",num2str(sigmas(i)),")"]);
      xlabel("x");
      ylabel("f(x)");
    endfor
endfor

figure;
for i=1:3
    for j=1:3
      k=((i-1)*3+j);
      subplot(3,3,k);
      plot(log(x+1),log(f(k,:)+1));
      title(["Distribution lognormale log-N(",num2str(mus(j)),",",num2str(sigmas(i)),")"]);
      xlabel("log(x+1)");
      ylabel("log(f(x)+1)");
    endfor
endfor

figure;

pop1 = exp(pop1);
pop2 = exp(pop2);
pop3 = exp(pop3);
subplot(311);
plot(x,f(4,:));
hold on;
x_pop1 = 0.1:1:50;
hist(pop1,x_pop1,1);
subplot(312);
plot(x,f(4,:));
hold on;
x_pop2 = 0.1:0.2:50;
hist(pop2,x_pop2,5);
subplot(313);
plot(x,f(4,:));
hold on;
x_pop3 = x;
hist(pop3,x,10);
