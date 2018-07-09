function g = discnorm(f, L)
% linearni transformace hodnot jasu na diskretni hodnoty od 1 do L

if nargin < 2,
  L = 256;  % pocet urovni jasu
end

f = double(f);

% linearni transformace na interval [0,1]
fmax = max(f(:));
fmin = min(f(:));
if fmax - fmin > 0,
  g = (f - fmin)/(fmax - fmin);
else
  g = zeros(size(f));
end

% prevod na diskretni hodnoty v rozsahu {1,..,L}
g = 1 + round((L - 1) * g);

return
