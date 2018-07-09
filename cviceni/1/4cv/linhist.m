function R = linhist(I)
% I...obrázek
I = im2double(I)
R = uint8((I-min(I(:)))/(max(I(:))-min(I(:))) * 255);