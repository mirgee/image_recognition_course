function R = damage2(I, H, SNR)
% R = damage(I, H, SNR) – rozmaze obrazek I s konvolucni
% maskou H a prida do nej bily sum o danem SNR
  R = conv2(I,H,'same')./conv2(ones(size(I)),H,'same');
  R = bilySum(R, SNR)
end
