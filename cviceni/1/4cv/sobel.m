function S = sobel(I, Prah)
% I...obrazek
% p...prah
M = [1 2 1; 0 0 0; -1 -2 -1];
R = abs(conv2(I,M)) > Prah;
R = R | (abs(conv2(I,M')) > Prah);
M = [2 1 0; 1 0 -1; 0 -1 -2];
R = R | (abs(conv2(I,M)) > Prah);
R = R | (abs(conv2(I,rot90(M))) > Prah);
zobr(R)