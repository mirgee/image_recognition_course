function findtemplate(im, temp, th, showtemp)

out = normxcorr2(temp, im);

[m,n] = size(temp);

out = out(m+1:end, n+1:end);

bw = out > th;

r = regionprops(bwlabel(bw))

if nargin > 3
  im(1:m, 1:n) = temp;
end

clf
imshow(im,[])
hold on
for i=1:length(r)
  rectangle('position', [r(i).Centroid(1), r(i).Centroid(2), size(temp,2), size(temp,2)]);
end