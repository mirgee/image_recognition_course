function fourierka_fft(img)
I = imread(img)
F = fft2(I)
zobr(fftshift(log(abs(F)+1)))