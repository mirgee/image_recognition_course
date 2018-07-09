function [T1, T2] = teziste(Img)
% [T1, T2] = teziste(Img) - vraci polohu teziste obrazu Img

[I1, I2, V] = find(Img);
S = sum(V);
T1 = sum(I1.*V) / S;
T2 = sum(I2.*V) / S;

