function R = myboundary(I)

%eroded = erosion(I, kruh(2,4))

%R = I - eroded
R = I - imerode(I, kruh(2,4))

end