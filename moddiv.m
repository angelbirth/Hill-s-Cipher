function y=moddiv(dividend,divisor,modulo)
y=mod(dividend*modinv(divisor,modulo),modulo);
endfunction