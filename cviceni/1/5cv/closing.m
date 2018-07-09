function R=closing(I,K)
dilatovany=dilatace(I,K)
R = erosion(dilatovany,K)
end