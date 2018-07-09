function J = zvyrazniHrany(I,prah,coef)
  F=fft2(I);
  mi=min(I(:));
  ma=max(I(:));
  K=(-kruhgauss(prah,size(I,1))+1)*coef+1;
  J=abs(ifft2(F.*fftshift(K)));
  J(J<mi)=mi;
  J(J>ma)=ma;
  mesh(K);
  zobr(J);