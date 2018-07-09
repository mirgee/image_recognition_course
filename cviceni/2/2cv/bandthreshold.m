function g = bandthreshold(f, t1, t2)

if nargin < 3
  t2 = max(f(:))
end

% g = t1 <= f <= t2 

g = (f >= t1) .* (f <= t2)

return