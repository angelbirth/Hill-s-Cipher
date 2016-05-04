function minor=minormod(A,i,j,m)
[r c]=size(A);
rows=1:r;
rows=find(rows!=i);
cols=1:c;
cols=find(cols!=j);
submat=A(rows,cols);
#eq(size(submat),[2 2])
 minor=detmod(submat,m);
endfunction
