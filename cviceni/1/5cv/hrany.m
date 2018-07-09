function R = hrany(I)
K=kruh(3,6)
erodovany = erosion(I,K)
R = double(I)-erodovany
zobr(R)
end