function R = morse2Abc(M)
% R = morse2Abc(M) - convert vector "[0 1]" representing morse ".-"
%   to character "A"

C = ' ETIANMSURWDKGOHVF#L#PJBXCYZQ#';
K = 1;
for I = 1 : length(M)
    K = 2*K + M(I);
end
R = C(min(K, 30));