function vynulovani_kvadrantu(img)
I = imread(img)
N1 = size(I,1)
N2 = size(I,2)
[X,Y]=meshgrid(-(N2-1)/2:(N2-1)/2, -(N1-1)/2:(N1-1)/2);
M = (X > 0 & Y>0) | (X<0 & Y<0)
M1 = ~M
M2 = M
FI = fft2(I)
zobr(((abs(FI))))
K1=FI.*M1
K2=FI.*M2
zobr(abs(ifft2(K1)))
zobr(abs(ifft2(K2)))