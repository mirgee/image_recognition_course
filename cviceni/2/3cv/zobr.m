function I = zobr (I, NothingToFig)
% I = zobr (I [,NothingToFig]) - displays normalized image
if nargin <= 1
  figure;
end
colormap(gray);
imagesc(I);
axis image;