function R = eroze(I, M)
% R = eroze(I, M) - vraci erozi binarniho obrazu s maskou M

I = double(logical(I));
F = filter2(M, I, 'same');
R = (F == sum(M(:)));