function primkySnimku(Img, Primek)
% primkySnimku(Img, Primek) - najde a vykresli primky na snimku
Hrany = sobel(Img, 400);
Hits = houghStud(Hrany, 360, 800);
zobr(Img);
% detekce hran
% Houghova transformace
% nachazeni nejvyznamnejsich primek
Uhlopricka = norm(size(Hrany));
for I = 1 : Primek
    waitforbuttonpress;
    % souradnice nejvetsi hodnoty v matici hitu
    [V,U] = find(Hits == max(Hits(:)),1);
    % prepocet uhlu na stupne
    Uhel = U / size(Hits,2) * 180;
    % prepocet vzdalenosti na pixely
    Vzdal = V / size(Hits,1) * 2 * Uhlopricka - Uhlopricka;
    % Vzdal = V / size(Hits,1) * Uhlopricka;
    % vykresleni
    kresliPrimku(Uhel, Vzdal, size(Hrany,2), size(Hrany,1));
    % vynulovani Hits(U,V) a jeho okoli
    Hits(max(V-20,1):min(V+20,size(Hits,1)), ...
    max(U-20,1):min(U+20,size(Hits,2))) = 0;
end