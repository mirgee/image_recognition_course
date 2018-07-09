function nazev = krajePodleVelikosti(idx)
    switch idx
        case 1
            nazev = 'Støedoèeský';
        case 2
            nazev = 'Budìjovický';
            % Jihoèeský
        case 3
            nazev = 'Plzeòský';
        case 4
            nazev = 'Brnìnský';
            % Jihomoravský
        case 5
            nazev = 'Jihlavský';
            % Kraj Vysoèina
        case 6
            nazev = 'Ostravský';
            % Moravskoslezský
        case 7 
            nazev = 'Ústecký';
        case 8
            nazev = 'Olomoucký';
        case 9
            nazev = 'Královéhradecký';
        case 10
            nazev = 'Pardubický';
        case 11
            nazev = 'Zlínský';
        case 12
            nazev = 'Karlovarský';
        case 13
            nazev = 'Liberecký';
        case 14
            nazev = 'Hlavní mìsto Praha';
    end
end