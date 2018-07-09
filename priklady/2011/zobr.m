function I = zobr(I)
% I = zobr(I) - zobrazi cernobily i barevny obrazek
%    automaticky nastavuje jas a kontrast

figure;
colormap(gray);
Z = I;
if (ndims(Z) > 2)
	if all(uint8(Z) == Z)
		Z = uint8(Z);
	else
		Z = Z - min(Z(:));
		Z = Z / max(Z(:));
	end;
end
imagesc(Z);
axis image;
