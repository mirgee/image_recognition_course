function M = gauss2(S, N)
% N je velikost matice, def. 3*S+1
% S je kovariancni matice

if nargin >= 2
  R = (N-1) / 2
  % R = 3*S+1
else
  R = 3*S
end

[X,Y] = meshgrid(-R:R)

M = (2*pi*S^2)^(-1)*exp(-0.5*(X.^2+Y.^2)/S^2)

M = M / sum(M(:))