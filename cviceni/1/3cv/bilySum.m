function R = bilySum(I, SNR)
MinI = min(I(:))
MaxI = max(I(:))
S = sqrt(var(I(:))/10^(SNR/10))
R = I + S*randn(size(I))
R(R<MinI) = MinI
R(R>MaxI) = MaxI
zobr(R)