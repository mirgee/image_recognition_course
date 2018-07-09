function highpass_lowpass(img)
I = imread(img)
K = kruh(80, size(I,1))
M1 = fftshift(~K)
M2 = fftshift(K)
FI = fft2(I)
K1=FI.*M1
K2=FI.*M2
zobr(abs(K1))
zobr(abs(K2))
zobr(abs(ifft2(K1)))
zobr(abs(ifft2(K2)))