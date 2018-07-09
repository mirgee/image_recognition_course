function R = myfft(I)
  R = fftshift(log(abs(fft2(I))+1))