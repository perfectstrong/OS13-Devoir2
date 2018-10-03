function[X]=geomGen(n,p)
X=ones(1,n);
for (i=1:n)
  trial=rand(1,1);
  k=1;
  while (trial > p)
    trial=rand(1,1);
    k++;
  endwhile
  X(i)=k;
endfor
endfunction