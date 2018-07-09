function M = gauss2ani(S1,S2, N)
  % M = gauss2 (S1, S2 [,N]) - vraci normovanou
  % 2D gaussovku o smerodatnych odchylkach S1 a S2
  % N je velikost matice, defaultne 3*max(S1*S2)+1
  if nargin >= 3
    R = (N-1) / 2;
  else
    R = 3*max(S1,S2);
  end
  [X, Y] = meshgrid( -R:R);
  M=(1/(2*pi*S1*S2))*exp((-1/2)*((X.^2/S1.^2)+(Y.^2/S2.^2)));
  M = M / sum(M(:));
end