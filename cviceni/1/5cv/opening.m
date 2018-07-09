function R=opening(I,K)
% K=kruh(11,5)
I = double( I ) / 255;
I = double( I ~= 0 );
erodovany = erosion(I,K)
R = dilatace(erodovany,K)
end