I = imread('vstup.pgm');
I = I == 0;
CS = label(I);
B = iboundary(I,CS==1);
zobr(CS==1);
%zobr(CS)

plot(B(:,1), B(:,2));

% The curvature of a circle drawn through them is simply four times the area of 
% the triangle formed by the three points divided by the product of its three sides. 
%K = 2*abs((x2-x1).*(y3-y1)-(x3-x1).*(y2-y1)) ./ ...
%  sqrt(((x2-x1).^2+(y2-y1).^2)*((x3-x1).^2+(y3-y1).^2)*((x3-x2).^2+(y3-y2).^2));
  
% Pro kazdy bod spocitat pomoci konecnych diferenci?
C = zeros(1,length(B));
x = B(:,1);
y = B(:,2);


for t=3:length(B) - 2
  C(t) = abs(fd(x,t)*sd(y,t)-fd(y,t)*sd(x,t)) / (fd(x,t)^2 + fd(y,t)^2)^1.5
end

close all;
hold on;
range = ceil(max(C) - min(C));
myColorMap = jet(range);

C(isnan(C)) = 0
for t=3:length(B)
  thisIndex = round(size(myColorMap, 1) * (C(t) - min(C)) / range + 1);
  thisColor = myColorMap(thisIndex, :);
  plot(x(t), y(t), '.', 'MarkerSize', 25, 'Color', thisColor);
end
hold off;