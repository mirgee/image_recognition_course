I = imread('curv.png');
binaryImage = im2bw(I(:,:,1));
%figure, imshow(binaryImage, []);
%
boundaries = bwboundaries(binaryImage);
%
x = boundaries{1}(:, 2);
y = boundaries{1}(:, 1);
windowSize = 10;
halfWidth = floor(windowSize/2);   %half window size
curvatures = zeros(size(x));
%
%k =10
for k = halfWidth+1 : length(x) - halfWidth
	theseX = x(k-halfWidth:k+halfWidth);   % 19 element of x
	theseY = y(k-halfWidth:k+halfWidth);   % 19 elemebt of y
	% Get a fit.
	coefficients = polyfit(theseX, theseY, 2);
	% Get the curvature
	curvatures(k) = coefficients(1);
	xc(k) = x(k);
	yc(k) = y(k);	

end
clc

% Get rid of ridiculous curvatures (straight line segments).
curvatures(abs(curvatures) > 20) = 0;

%curvatures = flip(curvatures)
%
plot(x, curvatures, 'b-');
hold on 
plot(y, curvatures, 'r-');

min_Cur = min(curvatures)
%
max_Cur = max(curvatures)
[L W] = size(curvatures);
%
CurCur = curvatures;
for i = 1 :L
    for j = 1 : W
        if CurCur (i,j) < 0  %negative values
           CurCur (i,j) =  CurCur (i,j) +(abs(min_Cur))
        elseif CurCur (i,j) > 0  %positive values
            CurCur (i,j) =  CurCur (i,j) + 100
        end
    end
end

curvatures = CurCur;
%%

%%
% Make up a colormap
minC = min(curvatures)
maxC = max(curvatures)
range = ceil(maxC - minC)
myColorMap = jet(range);
% Display the image again.
imshow(binaryImage);
hold on;
%
for k = halfWidth+1 : length(x) - halfWidth
	% Get the index in the color map.
	thisIndex = round(size(myColorMap, 1) * (curvatures(k) - minC) / range)
	
    fprintf('For point #%d, the colormap index is %d\n', k, thisIndex);
	if thisIndex <= 0
		thisIndex = 1;
	end
	if isnan(thisIndex)
		thisIndex = 1;
	end
	% Extract out the RGB triplet for this particular row in the color map.
	thisColor = myColorMap(thisIndex, :);
	plot(x(k), y(k), '.', 'MarkerSize', 25, 'Color', thisColor);
end
