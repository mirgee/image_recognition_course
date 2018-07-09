I = imread('Vstup.jpg')
I = rgb2gray(I)
I = I >= 100
I = medop(I)
% imwrite(I, 'skel.png', 'png')
I = myboundary(I)

for i=1:100
  I = thin(I)
end

imshow(I)

