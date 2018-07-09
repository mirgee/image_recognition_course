function [g, t] = otsu(f, L)
% Otsu algoritmus automatickeho vypoctu prahu
% http://web.ics.purdue.edu/~kim497/ece661/OTSU_paper.pdf

if nargin < 2,
  L = 256;  % pocet urovni jasu
end

f = discnorm(f, L);  % linearni transformace jasu na diskretni hodnoty od 1 do L

N = length(f(:));  % pocet pixelu
n = histogram(f, L);  % cetnost urovni jasu (histogram)
p = n / N;  % hustota pravdepodobnosti jasu

w = cumsum(p);  % distribucni funkce jasu (pravdepodobnost tridy w0)

m = cumsum((1:L)' .* p);  % kumulativni moment 1. radu
mT = m(L);  % stredni hodnota jasu

sB = (mT * w - m).^2 ./ (w .* (1 - w));  % mezitridni (between-class) rozptyl
sB((w .* (1 - w)) == 0) = 0;  % osetreni deleni nulou

[tmp, t] = max(sB(:));  % prah maximalizujici sB

figure;
bar(sB);
title(['between-class variance: prah = ' num2str(t)]);

g = (f >= t);  % oprahovany snimek

return
