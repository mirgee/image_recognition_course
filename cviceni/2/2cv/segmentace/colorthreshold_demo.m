% vymaskovani oblohy poloprahovanim na zaklade barvy

f = double(imread('sloup.png'));  % RGB
fR = f(:,:,1);
fG = f(:,:,2);
fB = f(:,:,3);
zobr([fR fG fB]);
title('barevne slozky: R G B');

fRB = fR - fB;  % priznak: rozdil cervene a modre slozky

L = 256;  % pocet urovni jasu
fRB = discnorm(fRB, L);  % normalizace
zobr(fRB);
title('rozdil cervene a modre slozky (R – B)');

[m, t] = otsu(fRB, L);  % vypocet masky

figure;
hist(fRB(:), L);
title(['histogram: prah = ' num2str(t)]);

g = L - (L-f) .* repmat(m, [1 1 3]);  % poloprahovani maskou m

% koeficienty pro prevod RGB snimku na sedotonovy
cR = 0.3; cG = 0.6; cB = 0.1;

zobr(cR*fR + cG*fG + cB*fB);
title('puvodni snimek');

zobr(m);
title('maska oblohy');

zobr(cR*g(:,:,1) + cG*g(:,:,2) + cB*g(:,:,3));
title('snimek s vymaskovanou oblohou');

return
