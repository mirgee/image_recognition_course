function [g, t, m] = semithreshold(f, t)
% poloprahovani, oprahuje pixely tmavsi nez prah t

if nargin < 2,
  L = 256;  % pocet urovni jasu
  [tmp, t] = otsu(f, L);
end

m = (f >= t);
g = f .* m;

return
