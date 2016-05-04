function d=detmod(A,m)
[r c]=size(A);
if r!=c;error("not a square matrix");endif
if r==2 && c==2
  d=mod(A(1)*A(4)-A(2)*A(3),m);
else
  d=0;
  for i=1:c
    t=minormod(A,1,i,m);
    if mod(i,2)==0; t=-t;endif
    d=mod(d+A(1,i)*t,m);
  endfor
endif  
endfunction