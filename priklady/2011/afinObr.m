function R = afinObr (Img, Tran, Pos)
% R = afinObr (Img, Tran, Pos)
%   vraci snimek po afinni transformaci Tran a posunuti Pos
%   souradnice jsou Matlabi 1. a 2. (nikoli X,Y)
%   pozice [V(1)]   =   [T(1,1) T(1,2)]   *   [U(1)]    +    [Pos(1)]
%          [V(2)]       [T(2,1) T(2,2)]       [U(2)]         [Pos(2)]

Vel = size(Img);                   % velikost vysledku
R = zeros(Vel);                    % vysledek
Ti = inv(Tran);                    % zpetna transformace
% pro vsechny body obrazu
for U1 = 1:Vel(1)
  for U2 = 1:Vel(2)
    X = round(Ti*[U1-Pos(1);U2-Pos(2)]);      % pozice bodu vzoru (nejblizsi)
    if all(X>=1 & X<Vel(:))                   % vzorovy bod je ve snimku
      R(U1,U2) = Img(X(1),X(2));              % kopie intenzity
    end
  end
end
