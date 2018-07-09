function [eout,thresh] = maar(varargin)
%MAAR Find edges in intensity image.
%   MAAR takes an intensity image I as its input, and returns a binary image
%   BW of the same size as I, with 1's where the function finds edges in I
%   and 0's elsewhere.
%
%   The Laplacian of Gaussian method finds edges by looking for zero
%   crossings after filtering I with a Laplacian of Gaussian filter.
%
%   Laplacian of Gaussian Method
%   ----------------------------
%   BW = MAAR(I) specifies the Laplacian of Gaussian method.
%
%   BW = MAAR(I,THRESH) specifies the sensitivity threshold for the
%   Laplacian of Gaussian method. MAAR ignores all edges that are not
%   stronger than THRESH. If you do not specify THRESH, or if THRESH is 
%   empty ([]), MAAR chooses the value automatically.
%
%   BW = MAAR(I,THRESH,SIGMA) specifies the Laplacian of Gaussian
%   method, using SIGMA as the standard deviation of the LoG filter. The
%   default SIGMA is 2; the size of the filter is N-by-N, where
%   N=CEIL(SIGMA*3)*2+1. 
%
%   [BW,thresh] = MAAR(I,...) returns the threshold value.
%
%   part of the EDGE program by  
%   Clay M. Thompson 10-8-92
%   Revised by Chris Griffin, 1996,1997
%   Copyright 1993-1998 The MathWorks, Inc.  All Rights Reserved.
%   $Revision: 5.12 $  $Date: 1997/11/24 15:34:36 $

error(nargchk(1,3,nargin));

a = varargin{1};
thresh=[];
sigma=2;

threshSpecified = 0;  % Threshold is not yet specified
for i = 2:nargin
   if prod(size(varargin{i}))<=1  % Scalar or empty
      if ~threshSpecified
         thresh = varargin{i};
         threshSpecified = 1;
      else
         sigma = varargin{i};
      end
   else
      error('Invalid input arguments');
   end
end
   
if sigma<=0
   error('Sigma must be positive');
end

[m,n] = size(a);
rr = 2:m-1; cc=2:n-1;

% The output edge map:
e = zeros(m, n);

fsize = ceil(sigma*3) * 2 + 1;  % choose an odd fsize > 6*sigma;
%      op = fspecial('log',fsize,sigma); 
              [x,y] = meshgrid(-(fsize-1)/2:(fsize-1)/2,-(fsize-1)/2:(fsize-1)/2);
				  std2 = sigma*sigma;
				  h1 = exp(-(x.*x + y.*y)/(2*std2));
				  h = h1.*(x.*x + y.*y - 2*std2)/(2*pi*(sigma^6));
				  op = h - sum(h(:))/prod(size(h)); % make the filter sum to zero
   
%   op = op - sum(op(:))/prod(size(op)); % make the op to sum to zero
   b = filter2(op,a);
   
   if isempty(thresh)
      pom = abs(b(rr,cc));
      thresh = .75*mean(pom(:));
   end
  
   % Look for the zero crossings:  +-, -+ and their transposes 
   % We arbitrarily choose the edge to be the negative point
   [rx,cx] = find( b(rr,cc) < 0 & b(rr,cc+1) > 0 ...
      & abs( b(rr,cc)-b(rr,cc+1) ) > thresh );   % [- +]
   e((rx+1) + cx*m) = 1;
   [rx,cx] = find( b(rr,cc-1) > 0 & b(rr,cc) < 0 ...
      & abs( b(rr,cc-1)-b(rr,cc) ) > thresh );   % [+ -]
   e((rx+1) + cx*m) = 1;
   [rx,cx] = find( b(rr,cc) < 0 & b(rr+1,cc) > 0 ...
      & abs( b(rr,cc)-b(rr+1,cc) ) > thresh);   % [- +]'
   e((rx+1) + cx*m) = 1;
   [rx,cx] = find( b(rr-1,cc) > 0 & b(rr,cc) < 0 ...
      & abs( b(rr-1,cc)-b(rr,cc) ) > thresh);   % [+ -]'
   e((rx+1) + cx*m) = 1;
   
   % Most likely this covers all of the cases.   Just check to see if there
   % are any points where the LoG was precisely zero:
   [rz,cz] = find( b(rr,cc)==0 );
   if ~isempty(rz)
      % Look for the zero crossings: +0-, -0+ and their transposes
      % The edge lies on the Zero point
      zero = (rz+1) + cz*m;   % Linear index for zero points
      zz = find(b(zero-1) < 0 & b(zero+1) > 0 ...
         & abs( b(zero-1)-b(zero+1) ) > 2*thresh);     % [- 0 +]'
      e(zero(zz)) = 1;
      zz = find(b(zero-1) > 0 & b(zero+1) < 0 ...
         & abs( b(zero-1)-b(zero+1) ) > 2*thresh);     % [+ 0 -]'
      e(zero(zz)) = 1;
      zz = find(b(zero-m) < 0 & b(zero+m) > 0 ...
         & abs( b(zero-m)-b(zero+m) ) > 2*thresh);     % [- 0 +]
      e(zero(zz)) = 1;
      zz = find(b(zero-m) > 0 & b(zero+m) < 0 ...
         & abs( b(zero-m)-b(zero+m) ) > 2*thresh);     % [+ 0 -]
      e(zero(zz)) = 1;
   end

eout = e;


