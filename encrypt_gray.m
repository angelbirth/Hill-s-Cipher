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
## @deftypefn {Function File} {@var{retval} =} encrypt_gray (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Engelbert Eric <ric@HP-G4-1314AU>
## Created: 2016-05-04

function [enc,time] = encrypt_gray (img, key)
if nargout==2;tic;endif
if ~isgray(img);error("Must be a grayscale image");endif
[r c]=size(img);
l=r*c;
if mod(l,3)==1; enc=zeros(l+2,1);
elseif mod(l,3)==2; enc=zeros(l+1,1);
else enc=zeros(l,1);
endif
enc(1:l)=img(:);
enc=reshape(enc,3,[]);
#for i=1:3:numel(enc)-2
#  block=mod(key*enc(i:i+2),256);
#  enc(i:i+2)=block(:);
#endfor
enc=mod(key*enc,256);
enc=uint8(reshape(enc(1:l),r,c));
if nargout==2;time=toc;endif
endfunction
