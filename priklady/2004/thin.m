function R = thin(I)

[row,col] = find(I == 1);
R = I

for i=1:length(row)
  x = row(i);
  y = col(i);
  if x >= max(R, 1) || x <= 1 || y >= max(R, 2) || y <= 1
    continue
  end
  
  ne = [I(x-1,y-1),I(x-1,y), I(x-1,y+1); I(x,y-1), I(x,y), I(x,y+1); I(x+1,y-1), ...
            I(x+1,y), I(x+1,y+1)]
            
  m1 = [-1, -1, -1; 0, 0, 0; 1, 1, 1] % chceme sumu 3
  m2 = [0, -1, 0; 1, 0, -1; 1, 1, 0]
  
  if sum(sum(m1.*ne)) == 3 || sum(sum(m2.*ne)) == 3 || sum(sum(rot90(m2).*ne)) == 3 || sum(sum(rot90(m1).*ne)) == 3
    R(x,y) = 0;
  end
end
end