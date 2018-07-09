function u = inverzniFiltr(z, h)
% z - rozmazany obrazek
% h - maska

Z = fft2(z)

H = fft2(h, size(z,1), size(z,2))

U = Z ./ H

u = abs(ifft2(U))