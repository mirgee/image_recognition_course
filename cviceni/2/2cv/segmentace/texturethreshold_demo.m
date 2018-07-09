% segmentace na zaklade jasove variance textury

L = 256;  % pocet urovni jasu
f = discnorm(imread('texture.png'), L);

R = 8;  % polomer ctvercove masky pro lokalni vypocet rozptylu jasu
m = ones(2*R+1)/(2*R+1)^2;
EX = conv2(f,m,'same');
EX2 = conv2(f.^2,m,'same');
varX = EX2 - EX.^2;  % lokalni rozptyl jasu

varX = discnorm(varX, L);  % normalizace
[g, t] = otsu(varX, L);  % vypocet prahu

figure;
hist(f(:), L);
title(['histogram: prah = ' num2str(t)]);

zobr(f);
title('puvodni snimek');

zobr(varX);
title(['lokalni rozptyl (maska ' num2str(2*R+1) ' x ' num2str(2*R+1) ')']);

zobr(g);
title(['prahovani na zaklade lokalniho rozptylu jasu: prah = ' num2str(t)]);

return
