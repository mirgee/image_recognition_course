function I = sulPepr(I, Pomer)
% I = sulPepr(I, Pomer) - degrades image I with white noise

A = rand(size(I));
I(A<=Pomer/2) = 0;
I(A>=1-Pomer/2) = 255;