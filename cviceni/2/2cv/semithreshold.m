function [g, t, m] = semithreshold(f, t)

if nargin < 2
  L = 256
  [tmp, t] = otsu(f,L)
end


m = (f >= t)
g = f .* m

return