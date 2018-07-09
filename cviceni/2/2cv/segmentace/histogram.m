function h = histogram(f, L)
% vypocet histogramu urovni jasu {1,..,L} v obrazku f

if nargin < 2,
  L = 256;  % pocet urovni jasu
end

h = histc(f(:), 1:L);

% explicitni vypocet:
% h = zeros(L, 1);
% for k = 1:L,
%   h(k) = length(find(f == k));
% end

return
