function u = wiener(z, h, SNR)

H = fft2(h, size(z,1), size(z,2))

W = conj(H) ./ (abs(H).^2 + 1/SNR)

Z = fft2(z) .* W

u = abs(ifft2(Z))