function h = histo(f, L)

if nargin() < 2
  L = 256
end

f = discnorm(f, L)

% h=zeros(L)

% 1
%for i=1:size(f,1)
%  for j=1:size(f,2)
%    h(f(i,j)) += 1
%  end
%end

% 2
% h = histc(f(:), 1:L)

% 3
for k = 1:L
 h(k) = length(find( f==k))
end

return