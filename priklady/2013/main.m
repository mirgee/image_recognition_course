%I = imread('cr-kraje.bmp');
%colors = 20;
%[I, map] = rgb2ind(I, colors);
%I = rgb2gray(I);
%imwrite(I, 'gray.png', 'png')
%imhist(I)
I = imread('gray.png');
NN = histc(I(:), 1:255);
nonzeros = find(NN > 0) % Hodnoty nenulovych intenzit
%I = discnorm(I,colors);
nonzeros = nonzeros(2:end-1)
M = cell(length(nonzeros));
A = zeros(1,length(nonzeros));
K = kruh(10,20);
for i=1:length(nonzeros)
  m = I == nonzeros(i);
  m = imclose(m, K);
  a = sum(sum(m));
  j = 1;
  while A(j) > a
    j = j+1;
  end
  for k=length(A):-1:j
    A(k+1) = A(k);
    M{k+1} = M{k};
  end
  A(j) = a;
  M{j} = m;
end

% Seradit podle velikosti a poradi == nova intenzita
for i=1:length(M)
  I(M{i}) = i;
end

% Pro kazdy trochu povyrust a podivat se na prunik se vsemi ostatnimi
for i=1:length(M)
  m = I == i;
  m = imdilate(m, K);
  for j=1:length(M)
    if j==i continue end;
    m2 = I == j;
    inter = m > 0 & m2 > 0;
    if sum(sum(inter)) > 0
      % i sousedi s j => vypsat
    end
  end
end