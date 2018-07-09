function R = distMat(Vects)
N = size(Vects,1);
for I = 1 : N
    for J = 1 : N
        R(I,J) = norm (Vects(I,:)-Vects(J,:));
    end
end