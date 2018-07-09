function I = sul_a_pepr(I, pomer)
R = rand(size(I))
B = R<pomer/2
C = R>1-pomer/2
I(B)=0
I(C)=255
zobr(I)