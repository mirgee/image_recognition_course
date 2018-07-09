function R = cumHist(Img)
% intenzita bile barvy
B = 255;
Vel = length(Img(:));
% pocet pixelu v obrazku
R = Img;
% vysledny snimek
S = 0;
% pocet zpracovanych pixelu
for K = 0 : B % prochazime pixely pres intenzity
    W = (Img == K);
    P = sum (W(:));
    R(W) = round((S + P/2) * B / Vel);
    S = S + P;
end