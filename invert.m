## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} invert (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Engelbert Eric <ric@HP-G4-1314AU>
## Created: 2016-04-10

# 3 accompanying elementary matrix operations:
# swaprow(mat,row1,row2): swap row1 with row2 in mat
# mult_row(mat,rowIndex,k): multiply row rowIndex in mat by k
# sub_mult_row(mat, minuend,subtrahend, k): subtract k*row subtrahend from minuend


function y = invert (mat, modulo)
[r ~]=size(mat);
temp=[mat(:,:) eye(r)];
%step 1: forward elimination
for i=1:r
  temp=mult_row(temp,i,modinv(temp(i,i),modulo));
  temp=mod(temp,modulo);
  for j=i+1:r
    if temp(j,i)==0; continue;endif;
    k=temp(j,i);
    %k=mat(j,i)*modinv(mat(i,i),modulo);
    %k=mod(k,modulo);
    temp=mod(sub_mult_row(temp,j,i,k),modulo);
  endfor
endfor
y=temp;

%step 2: backward elimination
for i=r:-1:1
  for j=i-1:-1:1
    k=y(j,i);
    y=mod(sub_mult_row(y,j,i,k),modulo);
  endfor
endfor
endfunction

function mat=swaprow(mat,row1,row2)
  temp=mat(row1,:);
  mat(row1,:)=mat(row2,:);
  mat(row2,:)=temp;
endfunction

function mat=mult_row(mat,rowIndex,k)
  mat(rowIndex,:)*=k;
endfunction

function mat=sub_mult_row(mat,minuend, subtrahend,k)
  sub=mat(subtrahend,:)*k;
  mat(minuend,:)-=sub;
endfunction

