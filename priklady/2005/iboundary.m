function bound = iboundary(S,p)

%
% bound = iboundary(S,p)
% construct inner boundary of the object S == p
% bound = [y,x] 
%


mask = logical(...
   	[0 1 0;...
       1 0 1;...
       0 1 0]);
 
move = [ 0 1; -1 0; 0 -1; 1 0];
        
k = 1;
S = (S==p);
% find the first segment element
[i j] = find(S == 1);
%cpos = min([i j]);
cpos = [i(1) j(1)];
bound(k,:) = cpos;
k = k +1;
% find the second element
dir = 3;
C = S(cpos(1)-1:cpos(1)+1,cpos(2)-1:cpos(2)+1);
c = C(mask);
c = [c(4) c(2) c(1) c(3)];
sdir = mod(dir+3,4);
c = [c(sdir+1:end) c(1:sdir)];
c = min(find(c == 1))-1;
dir = mod(sdir+c,4);
cpos = cpos + move(dir+1,:);
bound(k,:) = cpos;
k = k + 1;
% find the rest
while (1)
   C = S(cpos(1)-1:cpos(1)+1,cpos(2)-1:cpos(2)+1);
   c = C(mask);
   c = [c(4) c(2) c(1) c(3)];
   sdir = mod(dir+3,4);
   c = [c(sdir+1:end) c(1:sdir)];
   c = min(find(c == 1))-1;
   dir = mod(sdir+c,4);
   cpos = cpos + move(dir+1,:);
   bound(k,:) = cpos;
   k = k+1;
   % stop condition
   if (sum(cpos == bound(2,:)) == 2) & (sum(bound(k-2,:) == bound(1,:)) == 2)
      break;
   end
end
bound = bound(1:k-3,:);
