function K = kruh (R, N)
% K = kruh(R [,N]) - vraci kruhovou masku o polomeru R [v matici NxN]

% defaultni hodnoty
if nargin < 2
  P = R;
else
  P = (N-1)/2;
end

[X, Y] = meshgrid(-P:P, -P:P);
K = double(X.^2 + Y.^2 < R^2);