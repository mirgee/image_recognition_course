function R = myboundary(I)

eroded = erosion(I, kruh(2,4))

R = I - eroded

end