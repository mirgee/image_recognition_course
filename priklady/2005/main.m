%I = imread('Hvezdicky.pgm')

% Pozadi ma okolo 20

%I = medop((medop(I<15 | I > 25)))
%
%imwrite(I, 'stars.png', 'png')

%I = imread('stars.png')

%lab = label(I,1)

b = iboundary(lab, 1)

plot(b(:,1), b(:,2))