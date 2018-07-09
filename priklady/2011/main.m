I1 = imread('Picasso1.png');
I1 = im2double(I1);
I1 = rgb2gray(I1);

I2 = imread('Picasso2.png');
I2 = im2double(I2);
I2 = rgb2gray(I2);

figure
imshow(I1);
[x1,y1] = ginput(3);
close

figure
imshow(I2);
[x2,y2] = ginput(3);
close

%[xp0]     [x0 y0 1  0  0  0 ]
%[yp0]     [0  0  0  x0 y0 1 ]     [M11]
%[xp1]     [x1 y1 1  0  0  0 ]     [M12]
%[yp1]  =  [0  0  0  x1 y1 1 ]  *  [M13]
%[xp2]     [x2 y2 1  0  0  0 ]     [M21]
%[yp2]     [0  0  0  x2 y2 1 ]     [M22]
%[xp3]     [x3 y3 1  0  0  0 ]     [M23]
%[yp3]     [0  0  0  x3 y3 1 ]
%
%M21 = -M12
%M22 = M11

%[xp0]     [x0  y0 1 0]
%[yp0]     [y0 -x0 0 1]
%[xp1]     [x1  y1 1 0]     [M11]
%[yp1]  =  [y1 -x1 0 1]  *  [M12]
%[xp2]     [x2  y2 1 0]     [M13]
%[yp2]     [y2 -x2 0 1]     [M23]
%[xp3]     [x3  y3 1 0]
%[yp3]     [y3 -x3 0 1]

M = zeros(4,1);
X = zeros(2*length(x1), 4)
Y = zeros(2*length(x2), 1)
for i=1:2:length(x1)
    X(i,:) = [x1(i), y1(i), 1, 0]
    X(i+1,:) = [y1(i), -x1(i), 0, 1]
    Y(i) = x2(i)
    Y(i+1) = y2(i)
end

itrans = pinv(X) * Y
%itrans = [itrans(), ...]

% Get B
B1 = O(:,:,2) - O(:,:,3)
A1 = O(:,:,3) - O(:,:,1)