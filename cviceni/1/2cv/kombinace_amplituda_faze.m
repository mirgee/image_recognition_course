function kombinace_amplituda_faze(img1, img2)
I1 = imread(img1)
I2 = imread(img2)
F1 = fft2(I1)
F2 = fft2(I2)
zobr(abs(ifft(abs(F1).*exp(1i*angle(F2)))))