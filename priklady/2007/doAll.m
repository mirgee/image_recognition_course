%clear all;
I = imread('kapky.pgm');
%imshow(I);
I = discnorm(I);
%imshow(I);
%zobr(I);
G = kruhgauss(3,10);
%zobr(conv2(I, G, 'same'));
I = conv2(I, G, 'same')/sum(sum(G));

%zobr(otsu(I));
%zobr(localthreshold(I,20,20));

% Je treba pouzit bandthreshold a band nekolikrat posunout
M = I > 10;
%M = bandthreshold(I, 10, 80);
imshow(M);

%K = kruh(2,4);
%
%imshow(imopen(M,K));