function result=modinvmat(x,modulo)
d=det(x);
if gcd(uint16(mod(d,modulo)),uint16(modulo))>1
  error("not relatively prime")
endif
dmod=fix(mod(d,modulo));
dinv=modinv(dmod,modulo);
result=mod(dinv*(d*inv(x)),modulo);
endfunction
