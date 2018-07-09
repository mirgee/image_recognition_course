function bez_vlnek(img)
I = imread(img)
F=fft2(I)
FI=fftshift(F)

FI(size(FI,1)/2-10:size(FI,1)/2,size(FI,2)/2-10:size(FI,2)/2) = 0
FI(size(FI,1)/2:size(FI,1)/2+10,size(FI,2)/2:size(FI,2)/2+10) = 0

% nyni je treba nejak posunout
zobr(log(abs(FI)))
zobr(abs(ifft2(ifftshift(FI))))