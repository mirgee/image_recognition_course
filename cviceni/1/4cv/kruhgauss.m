function K = kruhgauss(R,N)
  % vraci gaussovskou masku o rozptylu R v mat. NxN
  [ X, Y] = meshgrid(-(N-1)/2:(N-1)/2,...
  -(N-1)/2:(N-1)/2);
  K=exp(-0.5*(X.^2+Y.^2)./R.^2);