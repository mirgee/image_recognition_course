function [g, t] = ptile(f, p)
% vypocet prahu tak aby byla plocha histogramu rozdelena v pomeru p:(1-p)
% p lezi v intervalu [0,1]

h = histogram(f);  % histogram

c = cumsum(h);  % kumulativni histogram

N = length(f(:));  % # pixelu

t = find(c >= N*p);
t = t(1);  % nejnizsi t splnujici podminku

g = (f >= t);  % oprahovany snimek

figure;
bar(c);
title(['kumulativni histogram: prah = ' num2str(t)]);

return
