function C = find_centroids(I)

[lab, N] = label(I);

C = zeros(N, 2);
for i=1:N
  R = lab == i;
  [rows, cols] = find(R==1);
  cx = mean( cols );
  cy = mean( rows );
  C(i,:) = [cx, cy];
end

end