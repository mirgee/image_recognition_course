function g = bandthreshold(f, t1, t2)
% prahovani obrazku podle jasu: jas objektu v intervalu [t1, t2]
% neni-li zadano t2: jas objektu >= t1 (jednoduche prahovani)

if nargin < 2,
  t2 = max(f(:));  % horni prah
end

g = (f >= t1) .* (f <= t2);

return
