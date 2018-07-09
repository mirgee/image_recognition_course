function K = kruh (R, N)
% K = kruh(R, N) - vraci kruhovou masku o polomeru R v matici NxN

[X, Y] = meshgrid(-(N-1)/2:(N-1)/2, -(N-1)/2:(N-1)/2);
K = double(X.^2 + Y.^2 < R^2);