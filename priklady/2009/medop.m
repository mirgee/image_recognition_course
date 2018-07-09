function R = medop(I,B,s)
% R = medop(I,B,s) - Median filter (iterative) implemented as a set operator
% I - input image
% B - mask for median, typically B = ones(3) (default)
% s - number of levels, 1 for binary object (default)
  
 if nargin < 2
   B = ones(3);
 end
 if nargin < 3
   s = 1;
 end

 I = double(I);
 B = B/sum(B(:));
 minV = min(I(:));
 maxV = max(I(:));
 
 R = zeros(size(I));
 for l=minV:maxV
   M = I>=l;
   for i=1:s
     M = conv2(double(M),B,'same')>=0.5;
   end
   R(M) = l;
 end
 