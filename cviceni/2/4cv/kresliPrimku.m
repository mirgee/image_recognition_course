function kresliPrimku (Uhel, Vzdal, MaxX, MaxY)
% kresliPrimku (Uhel, Vzdal, MaxX, MaxY)
%   vykresli primku do obdelniku
%   Uhel - uhel ve stupnich
%   Vzdal - vzdalenost primky od pocatku (i zaporna) v pixelech
%   MaxX - velikost obdelniku X (neboli size(Img,2))
%   MaxY - velikost obdelniku X (neboli size(Img,1))

Uhel = Uhel / 180 * pi;
P = [cos(Uhel),-sin(Uhel),Vzdal];        % rovnice primky
Q = [];

% pruseciky s osami
B(1,:) = cross(P, [1, 0, 0]);            
B(2,:) = cross(P, [0, 1, 0]);
B(3,:) = cross(P, [1, 0, -MaxY]);
B(4,:) = cross(P, [0, 1, -MaxX]);
D = B(:,3);
D(D == 0) = eps;
B = B ./ (D*[1,1,1]);

% body pruseciku v nasem obdelniku
if ((B(1,2) >= 0) && (B(1,2) <= MaxX))
    Q = [B(1,1:2); Q];
end
if ((B(2,1) > 0) && (B(2,1) <= MaxY))
    Q = [B(2,1:2); Q];
end
if ((B(3,2) > 0) && (B(3,2) <= MaxX))
    Q = [B(3,1:2); Q];
end
if ((B(4,1) > 0) && (B(4,1) < MaxY))
    Q = [B(4,1:2); Q];
end

% vykresleni
if size(Q,1) == 2          % kdyz primka protina obdelnik ve dvou bodech
    hold on;
    line(Q(:,2), Q(:,1), 'color', 'red', 'LineWidth', 2);
end
