function ft_vymazani_faze(img)
I = imread(img)
F = fft2(I)
zobr(log(ifft2(abs(F))))