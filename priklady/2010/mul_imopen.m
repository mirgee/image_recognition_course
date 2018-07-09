function I = mul_imopen(I, M, n)

for i=1:n
  I = imopen(I,M)
end

end