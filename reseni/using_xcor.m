star = imread('star.png');
star = rgb2gray(star);
star = star > 150;
%imshow(star);

africa = imread('Africa.png');
africa = rgb2gray(africa);
africa = africa > 150;

%imshow(africa);

cor = normxcorr2(star, africa);

%zobr(cor > 0.6);

cities = cor > 0.65;
%cities = thin(cities);
%imshow(cities);

[xs,ys] = find(cities);

xs = xs - size(star,2)/2;
ys = ys - size(star,1)/2;


imshow(africa);
hold on;
%plot(ys, xs, 'go');
%hold off;

C = find_centroids(cities);
C(:,1) = C(:,1)-size(star,1)/2;
C(:,2) = C(:,2)-size(star,2)/2;
plot(C(:,1), C(:,2), 'ro', 'markersize', 20, 'LineWidth',4);

%for i=1:length(C)
%  rectangle('Position',[C(i,1),C(i,2),5,5],'Curvature',[1,1], 'FaceColor','r')
%end

%hold off;

chosen_city = 1;
closest_city_dist = 0;
% Find city with maximum closest city distance
for i=1:length(C)
  i_closest_dist = 10000000000000000;
  for j=1:length(C)
    d = sqrt((C(i,1)-C(j,1))^2 + (C(i,2)-C(j,2))^2);
    if d < i_closest_dist && j ~= i
      i_closest_dist = d
    end
  end
  if i_closest_dist > closest_city_dist
    chosen_city = i;
    closest_city_dist = i_closest_dist;
  end
end

plot(C(chosen_city, 1), C(chosen_city, 2), 'go', 'markersize', 20, 'LineWidth',4);
