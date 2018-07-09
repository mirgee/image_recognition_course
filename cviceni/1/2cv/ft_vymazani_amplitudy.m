function ft_vymazani_amplitudy(img)
I = imread(img)
F = fft2(I)
zobr(abs(ifft2(exp(1i*angle(F)))));