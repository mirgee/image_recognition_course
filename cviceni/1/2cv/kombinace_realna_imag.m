function kombinace_realna_imag(img1, img2)
I1 = imread(img1)
I2 = imread(img2)
F1 = fft2(I1)
F2 = fft2(I2)
zobr(ifft2(real(F1)+(1i*imag(F2))));