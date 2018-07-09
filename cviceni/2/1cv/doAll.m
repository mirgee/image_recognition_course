%I = imread('segm.pgm')
%I = double(I ~= 1)
I = imread('stars.png')
[CS, N] = label(I)
%B = iboundary(CS == 3)

for i = 1:N
  PriFD(i,:) = fourDesc(CS == i, 5)
  PriHun(i,:) = hun(CS == i);
  PriHuc(i,:) = huc(CS == i);
end

%zobrPriz(PriFD)

ClaFD = distMat(PriFD);
ClaHun = distMat(PriHun);
ClaHuc = distMat(PriHuc);

%zobr(ClaFD < 0.007)

%zobrTridy(CS, ClaFD < 0.007);
zobrTridy (CS, ClaHun < 0.0001);
%zobrTridy (CS, ClaHuc < 0.1e20);