function F=pocet(I)
I=I<90
K=kruh(33,66)
I=erosion(I,K)
zobr(I)
[CS,F] = label(I,1)