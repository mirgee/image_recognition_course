function Hits = houghStud (Img, Uhlu, Delek)
% Hits = houghStud (Img, Uhlu, Delek) - houghova transformace pro primky
%   Uhlu je podrobnost v uhlech
%   Delek je podrobnost ve vzdalenosti

Hits = zeros(Delek, Uhlu);                    % alokace vysledku Hough Transform
PixNaDelky = Delek / norm(size(Img)) / 2;     % prepocet pixelu na rastr delek
%PixNaDelky = Delek / norm(size(Img));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% projiti vsech pixelu snimku
for Y = 1 : size(Img,1)
    for X = 1 : size(Img,2)
    % chci jen nenulove body
        if ~Img(Y,X)
            continue
        end
        % pro vsechny smery primek prochazejicich bodem pocitam jejich vzdalenost
        for U = 1 : Uhlu
            % uhel v radianech
            Alfa = U / Uhlu * pi;
            % vzdalenost primky od pocatku v pixelech
            C = sin(Alfa) * X - cos(Alfa) * Y;
            % vzdalenost preskalovana na 1 az Delek
            V = round(C*PixNaDelky + (Delek-1)/2) + 1;
%            V = round(C*PixNaDelky) + 1;
            % bod s uhlem U ma pro vzdalenost V dalsi hit
            Hits(V,U) = Hits(V,U) + 1;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% zobrazeni Haughova prostoru
colormap gray;
imagesc(Hits);
axis xy;
% stupnice na osach v uhlech a pixelech
set(gca,'XTick',[0:1/18:1]*Uhlu);
set(gca,'XTickLabel', round(get(gca, 'XTick')/Uhlu*180));
set(gca,'YTick',[0:0.05:0.99]*Delek);
set(gca,'YTickLabel', round((get(gca, 'YTick')-Delek/2)/PixNaDelky));
grid on;
