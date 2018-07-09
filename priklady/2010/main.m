%I = imread('Morseovka.png');
%
%I = imresize(I, 0.5);
%
%I = rgb2gray(I);
%
%I = I < 180;


l = imread('line.png');

%md = imread('m_s.png');

%dot = imread('m_d.png');

%out = normxcorr2(md, l);

%slashes = out > 0.3;


lines = imopen(l, ones(1,5));

rest = (l - imdilate(lines, kruh(2,4))) > 0;

dots = rest

dots(1:size(dots,1)/2-5,:) = 0;
dots(size(dots,1)/2+5:end,:) = 0;

dots = imopen(dots, ones(1,3));

slashes = (rest - imdilate(dots, kruh(2,4))) > 0;

c_lines = round(find_centroids(lines));
c_dots = round(find_centroids(dots));
c_slashes = round(find_centroids(slashes));

w = []
for col=1:size(l,2)
  if length(find(c_lines == col)) > 0
    w(length(w)+1) = 1;
  end
  if length(find(c_dots == col)) > 0
    w(length(w)+1) = 0;
  end
  if length(find(c_slashes == col)) > 0
    res = morse2Abc(w);
    print(res);
    w = [];
  end
end

% 1. radek
%zobr(dil_kr(20:50, :))
%
%zobr(dil_kr(80:110, :))
%
%zobr(dil_kr(170:200, :))
%
%zobr(dil_kr(210:240, :))
%
%zobr(dil_kr(260:290, :))
%
%zobr(dil_kr(300:330, :))