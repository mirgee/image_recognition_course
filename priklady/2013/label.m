function [CS, ccounter] = label(ll,picflag)

%
% [CS ccounter] = label(ll,flag)
%
% Label segments using 4-connectivity 
% ll .. input binary image (1's objects, 0's background)
% picflag .. if defined, also display the final labeled image 
% CS .. output image with taged objects  
% ccounter .. number of taged objects
%
% You can select individual objects by typing CS==i, where i=1,..,ccounter
%


% negative for compatibility reasons
ll = ~ll;
% working marix (may contain open segments)
OS = zeros(size(ll));
% final matrix
CS = zeros(size(ll));

w = size(ll,2);
h = size(ll,1);

% counter of close segments
ccounter = 1;

% scanline index
scanind = 1;

% first line 
scanline = ll(:,scanind);
[seg c] = segment(scanline);
OS(:,scanind) = seg;

% counter of open segments
ocounter = c+1;

% main loop; do one column by one
for scanind = 2:w
   if rem(scanind,10)==0 
      scanind
   end
   
   
   [seg c] = segment(ll(:,scanind));
   % create or attache and/or join
   for i=1:c
      joints = (OS((seg == i) & OS(:,scanind-1),scanind-1));
      % no joints, new segment starts
      if isempty(joints)
         OS((seg==i),scanind) = ocounter;
         ocounter = ocounter + 1;
      else
         joints = simplify(joints);
         % attach current segment to the first neighbouring one
         OS((seg==i),scanind) = joints(1);
         % more neighbours? join them all
         for k = joints(2:end)
            OS(OS == k) = joints(1);
         end
      end
   end
end

% relabel segments so that each label in the interval 1..NO_OF_SEGMENTS is used
for i = 1:ocounter-1
   mask = find(OS == i);
   if ~isempty(mask)
      CS(mask) = ccounter;
      ccounter = ccounter + 1;
   end
end

ccounter = ccounter-1

if exist('picflag')
    figure; colormap(gray);
    imagesc(CS~=0);
    axis image;
    for i=1:ccounter
        [k l] = find(CS==i);
        text(min(l),min(k),num2str(i),'Color','r');
    end
end

% segment one image line
function [o, s] = segment(sl)

o = zeros(length(sl),1);;
d = conv([1; sl; 1],[-1; 1]);
d = d(2:end-1);
l = find(d == 1);
r = find(d == -1);
%r = r-1;
s = 0;
for i=[l r-1]'
   s= s+1;
   o(i(1):i(2)) = s;
end

% remove multiple occurences of the same number
function s = simplify(j)

m = conv(j,[-1; 1]);
m = find(m~=0);
s = j(m(1:end-1)).';
