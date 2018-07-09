function fourierka_angle(img)
I = imread(img)
F = fft2(I)
zobr(ifft2(imag(F)))