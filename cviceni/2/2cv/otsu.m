function [g,t] = otsu(f,L)

if nargin < 2
  L = 256
end

f = discnorm(f,L)

N = length(f(:))
n = histo(f, L) % cetnost urovni
p = n / N 

w = cumsum(p) % distirbucni fce

m = cumsum((1:L)'.*p)

mT = m(L) % tesizte

sB = (mT * w - m).^2 ./ (w .* (1 - w))
sB((w .* (1-w)) == 0) = 0 % osetreni

[tmp, t] = max(sB(:))

figure
bar(sB)
title(['between-class variance: prah = ' num2str(t)])

g = (f >= t)

return

