slovnik = imread('slovnik.bmp');
slovnik = im2double(slovnik);
%imshow(slovnik);

slovnik = (slovnik(:,:,1) == 1 & slovnik(:,:,2) == 0 & slovnik(:,:,3) == 0);
slovnik_c = imopen(slovnik, ones(2,2));

[CS, N] = label(slovnik_c);

%imshow(CS==3);

M = {};

for i=1:N
  m = CS == i;
  [r,c] = find(m);
  M{i} = slovnik(min(r):max(r), min(c):max(c));
  M{i} = M{i}(10:20,10:20) == 0;
  [r,c] = find(M{i});
  M{i} = M{i}(min(r):max(r), min(c):max(c));
end

sneh = imread('snehulak.bmp');
sneh = im2double(sneh);
sneh = (sneh(:,:,1) == 1 & sneh(:,:,2) == 0 & sneh(:,:,3) == 0);
sneh_c = imclose(sneh, ones(6));

numbers = (sneh-sneh_c)<0;

%imshow(normxcorr2(numbers, M{1}) > 0.05);

% YESSS!!!!
imshow(imopen(numbers, M{3})+imopen(numbers, M{2}));

for i = 1:10
  
end