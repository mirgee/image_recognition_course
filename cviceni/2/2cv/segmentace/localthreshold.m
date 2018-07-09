function [g, t] = localthreshold(f, n1, n2)
% lokalni prahovani s automatickym vypocet lokalniho prahu Otsu algoritmem
% rozdeleni obrazku f na n1-krat-n2 oblasti, prahovani kazde oblasti zvlast

% velikost oblasti
d1 = floor((0:n1)*size(f,1)/n1);
d2 = floor((0:n2)*size(f,2)/n2);

g = zeros(size(f));
t = zeros(n1, n2);  % hodnoty lokalnich prahu
for j1 = 1:n1,
  for j2 = 1:n2,
    [g(1+d1(j1):d1(j1+1),1+d2(j2):d2(j2+1)), t(j1,j2)] = otsu(f(1+d1(j1):d1(j1+1),1+d2(j2):d2(j2+1)));
    close;  % zavreni okna s grafem between-class variance
  end
end

return
