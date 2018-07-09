function R = roberts(I,Prah)
% I...obrázek
% Práh...práh
M=[-1,1];
R1=abs(conv2(I,M,'same'));
R2=abs(conv2(I,M','same'));
R=R1 > Prah | R2 > Prah;
zobr(R)
zobr(R1)