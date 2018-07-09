I = imread('Vstup_fdw.png');
I = I(:,:,2) > 100
imshow(I)

S = find_largest_squares(I)

[~, pos] = max(S(:));
[r c] = ind2sub(size(S), pos);
rectangle('Position',[c,r,S(r,c),S(r,c)], 'EdgeColor','r', 'LineWidth',3);
% Remove it and rerun
I(r:r+S(r,c), c:c+S(r,c)) = 0
imshow(I)