function t=modinv(a, n)
%for i=1:n-1
%if mod(a*i,n)==1;t=i;break;endif
%endfor
    t = 0;     newt = 1;    
   r = n;     newr = a;    
    while newr != 0
        quotient = fix(r / newr);
        temp=newt;
        newt=t-quotient*newt;
       t=temp;
        temp=newr;
        newr=r-quotient*newr;
        r=temp;
    endwhile
    if r > 1; error( "not coprime");endif
    if t < 0; t += n;endif
endfunction