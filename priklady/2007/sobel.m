function R = sobel (I, Prah)
% R = sobel (I, Prah) - Sobel edge detector with threshold Prah on image I

M = [1 2 1; 0 0 0; -1 -2 -1];
R = abs(conv2(I,M,'same')) > Prah;
R = R | (abs(conv2(I,M','same')) > Prah);
M = [2 1 0; 1 0 -1; 0 -1 -2];
R = R | (abs(conv2(I,M,'same')) > Prah);
R = R | (abs(conv2(I,rot90(M),'same')) > Prah);
