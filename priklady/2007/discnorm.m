function g = discnorm(f, L)

if nargin() < 2
L = 256
end

f = double(f)

fmax = max(f(:))
fmin = min(f(:))

if fmax - fmin > 0
  g = (f - fmin)/(fmax - fmin)
else
  g = zeros(size(f))  
end

g = 1 + round((L-1)*g)

return