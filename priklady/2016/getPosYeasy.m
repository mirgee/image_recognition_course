function posY = getPosY(F)
% F ... RGB image
% posY ... new Y-position of blue block (row in image F)

[XXX, YYY] = find(F(:,:,1) == 255 & F(:,:,2) == 255 & F(:,:,3) == 0);

posY = mean(YYY);

end