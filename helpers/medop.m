function R = medop (I, Mask, Count)
% R = medop (I,Mask,Count) - Median filter (iterative) implemented as a set operator
%   Mask represents region for the median, Count is number of repeat steps (default 1) 
 
 B = double(logical(Mask));
 B = B / sum(B(:));
 minV = min(I(:));
 maxV = max(I(:));
 
 if nargin < 3
   Count = 1;
 end
 R = zeros(size(I));
 for l=minV:maxV
   M = I>=l;
   for i=1:Count
     M = conv2(double(M),B,'same')>=0.5;
   end
   if mod(l,10) == 0
     l
   end
   R(M) = l;
 end
 