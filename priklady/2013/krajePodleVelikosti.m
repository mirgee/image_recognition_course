function nazev = krajePodleVelikosti(idx)
    switch idx
        case 1
            nazev = 'St�edo�esk�';
        case 2
            nazev = 'Bud�jovick�';
            % Jiho�esk�
        case 3
            nazev = 'Plze�sk�';
        case 4
            nazev = 'Brn�nsk�';
            % Jihomoravsk�
        case 5
            nazev = 'Jihlavsk�';
            % Kraj Vyso�ina
        case 6
            nazev = 'Ostravsk�';
            % Moravskoslezsk�
        case 7 
            nazev = '�steck�';
        case 8
            nazev = 'Olomouck�';
        case 9
            nazev = 'Kr�lov�hradeck�';
        case 10
            nazev = 'Pardubick�';
        case 11
            nazev = 'Zl�nsk�';
        case 12
            nazev = 'Karlovarsk�';
        case 13
            nazev = 'Libereck�';
        case 14
            nazev = 'Hlavn� m�sto Praha';
    end
end