function F=dilatace(I,B)
I = double(I > 0)
B = double(B > 0)
F = double(conv2(I, B, 'same') > 0)
end