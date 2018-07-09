function zobrPriz(P)
% zobrPriz(P) - zobrazi prvni dve slozky priznakovych
% vektoru
figure;
plot(P(:,1), P(:,2), 'w');
for I = 1 : size (P,1)
text(P(I,1), P(I,2), ['\times' num2str(I)]);
end