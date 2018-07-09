star = imread('star.png');
%star = rgb2gray(star);
%star = star > 80;
imshow(star);
%star = [0 0 0 0 1 0 0 0 0;
%        0 0 0 0 1 0 0 0 0;
%        0 0 0 1 1 1 0 0 0;
%        1 1 1 1 1 1 1 1 1;
%        0 1 1 1 1 1 1 1 0;
%        0 0 1 1 1 1 1 0 0;
%        0 0 1 1 1 1 1 0 0;
%        0 0 1 1 0 1 1 0 0;
%        0 1 1 0 0 0 1 1 0; ];

evropa = imread('Afrika.png');
%evropa = rgb2gray(africa);
%evropa = africa > 100;

%imshow(evropa);

cor_r = normxcorr2(star(:,:,1), evropa(:,:,1));
cor_g = normxcorr2(star(:,:,2), evropa(:,:,2));
cor_b = normxcorr2(star(:,:,3), evropa(:,:,3));

%zobr(cor > 0.6);

cor_threshold = 0.68;
cities = cor_r > cor_threshold & cor_g > cor_threshold & cor_b > cor_threshold;
%cities = thin(cities);
%imshow(cities);

[xs,ys] = find(cities);

xs = xs - size(star,2)/2;
ys = ys - size(star,1)/2;


imshow(evropa);
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
