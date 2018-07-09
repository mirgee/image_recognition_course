function R = fourDesc(I, N)
% vraci n fourierovych dekriptoru snimku I
B = iboundary(I);
X = B(:,2);
Y = B(:,1);
F = X + 1i*Y;
FT = abs (fft(F));
R = FT(2:N+1);
R = R / length(X)^2;
end

