function R = dilatace(I, M)
% R = dilatace(I, M) - vraci dilataci binarniho obrazu s maskou M

I = double(logical(I));
F = filter2 (M, I, 'same');
R = (F~=0);
