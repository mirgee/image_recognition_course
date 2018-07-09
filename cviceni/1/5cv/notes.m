function R=notes(I)
I=(I == 255)
I2=opening(I,ones(3,50))
R=I-I2
end