function R = erosion(I,B)

I = double(I > 0)
B = double(B > 0)
R = double(filter2(B, 1-I, 'same') == 0)
% R = double(filter2(B, I,'same') == nnz(B); %sum(B(:))
% imerode()
end