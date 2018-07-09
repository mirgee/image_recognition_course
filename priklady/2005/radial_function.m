function R = radial_function(cx, cy, b)

for j=1:length(b(:,1))
  yy = b(j,1);
  xx = b(j,2);
  d = sqrt( (cx - xx)^2 + (cy - yy)^2 );
  R(j) = d;
end

%figure;
%plot(R);
%waitforbuttonpress;

end