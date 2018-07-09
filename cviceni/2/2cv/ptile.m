function [g, t] = ptile(f, p)
% Najdu prvni cislo v kumulativnim histogramu mensim nez t

%c = cumsum(f)

%t = find(c < N*p)

h = histo(f)

c = cumsum(h)

N = length(f(:))

t = find(c >= N*p, 1)

g = (f >= t)

figure
bar(c)
title(['kumulativni histogram: prah = ' num2str(t)])

return