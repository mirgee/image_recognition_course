%%I = imread('segm.pgm')
%%I = double(I ~= 1)
%I = imread('stars.png')
%[CS, N] = label(I)
%%B = iboundary(CS == 3)
%
%for i = 1:N
%  PriFD(i,:) = fourDesc(CS == i, 5)
%  PriHun(i,:) = hun(CS == i);
%  PriHuc(i,:) = huc(CS == i);
%end
%
%%zobrPriz(PriFD)
%
%ClaFD = distMat(PriFD);
%ClaHun = distMat(PriHun);
%ClaHuc = distMat(PriHuc);
%
%%zobr(ClaFD < 0.007)
%
%%zobrTridy(CS, ClaFD < 0.007);
%zobrTridy (CS, ClaHun < 0.0001);
%%zobrTridy (CS, ClaHuc < 0.1e20);

I = imread('stars.png');

C = find_centroids(I);

figure
hold on;
imshow(I);
plot(C(:,1), C(:,2), 'rx');

[lab, N] = label(I);
num_peaks = zeros(1, N);
for i=1:N
  b = iboundary(lab, i);
  R = radial_function(C(i,1), C(i,2), b);
%  num_peaks(i) = sum(find(R == 20))/2;
  num_peaks(i) = length(find(diff(sign(R-min(R)-5)) > 0));
%  num_peaks(i) = length(findpeaks(R, 'MinPeakDistance', 10));
  text(C(i,1), C(i,2), num2str(num_peaks(i)));
end
num_peaks
hold off