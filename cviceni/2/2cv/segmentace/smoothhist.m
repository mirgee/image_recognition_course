function h2 = smoothhist(h, R)
% vyhlazeni histogramu h obdelnikem sirky 2*R+1

L = length(h);  % pocet urovni jasu

m = ones(2*R+1, 1);  % konvolucni maska

h2 = conv2(h, m, 'same');  % konvoluce
% h2 = h2 ./ (2*R+1);  % normalizace bez osetreni okraju
h2 = h2 ./ conv2(ones(L,1), m, 'same');  % normalizace s osetrenim okraju

return
