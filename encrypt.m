## Copyright (C) 2016 Engelbert Eric
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} encrypt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Engelbert Eric <ric@HP-G4-1314AU>
## Created: 2016-04-04

function [img] = encrypt (image, key)
if size(key)!=[3 3];error("key must be 3z3 matrix");endif
if isequal(class(key),"char");key=double(key);endif
if ~isequal(class(key),"double");error ("must have a double key");endif
[r c d]=size(image);
img=zeros(r,c,d,"uint8");
for i=1:r
  for j=1:c
    block=double(reshape(image(i,j,:),3,1));
    newblock=mod(key*block,256);
    img(i,j,:)=uint8(newblock(:));
  endfor
endfor
endfunction
