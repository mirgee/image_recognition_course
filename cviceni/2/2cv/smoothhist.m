function h2 = smoothhist(h, R)

L = length(h)

m = ones(2*R+1, 1)

h2 = conv2(h, m, 'same')

% h2 = h2 ./ (2*R+1) % normalizace bez osetreni okraju

h2 = h2 ./ conv2(ones(L,1), m, 'same') 

return