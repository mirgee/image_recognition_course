function maze_solution
% Demo to solve a maze using mathematical morphology.
% This demo works for "perfect mazes."  A perfect maze is defined 
% as a maze which has one and only one path from any point in the 
% maze to any other point. This means that the maze has no
% inaccessible sections, no circular paths, and no open areas. 
% A perfect maze should have only 2 walls (I believe).
% No searching or optimization methods (such as A* or dynamic
% programming) are used - only morphology and standard image
% processing methods.
% Only tested for 8 bit integer color and monochrome images.
% Maze images should have dark walls on a light background.
% Maze may be surrounded by white, or go right out to the edge
% of the image and have the outer wall be the 
% outer boundary of the image.
% Method/algorithm to create mazes:
% http://del.typepad.com/del/2006/10/carving_perfect.html
% Site to create your own random mazes:
% http://www.astrolog.org/labyrnth/java.htm
% Demo mazes used to test this m-file:
%	http://www.erclc.org/StaffPages/David/Mazes/Maze1.gif (to test success)
%	http://www.clickmazes.com/mazes2/tk1b2m1x.gif (to test failure)
% by ImageAnalyst, April 2010

% Clean up.
clc; 
close all; 
clear all; 
fontSize = 20;  % Font size for image captions.

% Change the current folder to the folder of this m-file.
% (The line of code below is from Brett Shoelson of The Mathworks.)
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
	
% For convenience in browsing, set a starting folder from which to browse.
startingFolder = 'C:\Documents and Settings\tk2013\My Documents\My Pictures\MISC\Mazes';
if ~exist(startingFolder, 'dir')
	% If that folder doesn't exist, just start in the current folder.
	startingFolder = pwd;
end

continueWithAnother = true;
promptMessage = sprintf('Please specify a maze image (in the next window).\nThis program will attempt to solve the maze.');
button = questdlg(promptMessage, 'maze_solution', 'OK', 'Cancel', 'OK');
if strcmpi(button, 'Cancel')
	continueWithAnother = false;
end

while continueWithAnother
	% Get the name of the maze image file that the user wants to use.
	defaultFileName = fullfile(startingFolder, '*.*');
	[baseFileName, folder] = uigetfile(defaultFileName, 'Select maze image file');
	if baseFileName == 0
		% User hit cancel.  Bail out.
		return;
	end
	fullFileName = fullfile(folder, baseFileName);


	% Here are some hard coded file names for ease in developing and debugging,
	% so we don't have to use uigetfile() all the time.

	% Gotten from http://www.erclc.org/StaffPages/David/Mazes/Maze1.gif
	% This maze works fine.
	% fullFileName = fullfile(folder, 'Maze1.gif');

	% Gotten from http://www.mattneuman.com/maze.htm
	% This is a test maze that won't work because it is not a "non-perfect maze."
	% fullFileName = fullfile(folder, 'Maze of Sisyphus.gif');

	% Open the maze image file.
	originalImage = imread(fullFileName);
	[rows cols numberOfColorBands] = size(originalImage);

	% Convert to monochrome for processing.
	if numberOfColorBands > 1
		% Convert to monochrome.
		redPlane = originalImage(:, :, 1);
		greenPlane = originalImage(:, :, 2);
		bluePlane = originalImage(:, :, 3);
		% Find the standard deviation of each color channel.
		redStdDev = std(single(redPlane(:)));
		greenStdDev = std(single(greenPlane(:)));
		blueStdDev = std(single(bluePlane(:)));
		% Take the color channel with the highest contrast.
		% Transfer it into a monochrome image.  This will be the one that we use.
		if redStdDev >= greenStdDev && redStdDev >= blueStdDev
			% Red has most contrast - use that channel.
			monoImage = single(redPlane);
		elseif greenStdDev >= redStdDev && greenStdDev >= blueStdDev
			% Green has most contrast - use that channel.
			monoImage = single(greenPlane);
		else
			% Blue has most contrast - use that channel.
			monoImage = single(bluePlane);
		end
	else
		monoImage = single(originalImage);
	end
	% Now we have a monochrome image that we can use to solve the maze.
	% Display the results of this step.
	close all;	% Close any prior windows that are open from a prior run.
	subplot(2, 2, 1);
	imshow(monoImage, []);
	title('Original Image', 'FontSize', fontSize);
	set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

	% Scale image to 0-255.
	maxValue = max(max(monoImage));
	minValue = min(min(monoImage));
	monoImage = uint8(255 * (single(monoImage) - minValue) / (maxValue - minValue));
	% Threshold to get the walls.  This will also sharpen up blurry, fuzzy wall edges.
	thresholdValue = uint8((maxValue + minValue) / 2);
	binaryImage = 255 * (monoImage < thresholdValue);
	% Display the results of this step.
	subplot(2, 2, 2);
	imshow(binaryImage, []);
	title('Binary Image - The walls are white here, instead of black', 'FontSize', fontSize);

	% Label the image to identify discrete, separate walls.
	[labeledImage numberOfWalls] = bwlabel(binaryImage, 4);     % Label each blob so we can make measurements of it
	coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % pseudo random color labels
	% Display the results of this step.
	subplot(2, 2, 3);
	imshow(coloredLabels); 
	caption = sprintf('Labeled image of the %d walls, each a different color', numberOfWalls);
	title(caption, 'FontSize', fontSize);
	if numberOfWalls ~= 2
		message = sprintf('This is not a "perfect maze" with just 2 walls.\nThis maze appears to have %d walls,\nso you may get unexpected results.', numberOfWalls);
		uiwait(msgbox(message));
	end

	% Take the first label.  This will be the first wall.
	% For a perfect maze (only two walls) you can take either wall, so let's take the first one.
	binaryImage2 = (labeledImage == 1);
	% Display the results of this step.
	subplot(2, 2, 4);
	imshow(binaryImage2, []);
	title('One of the walls', 'FontSize', fontSize);

	% Dilate the walls by a few pixels
	dilationAmount = 7; % Number of pixels to dilate and erode.
	% IMPORTANT NOTE: dilationAmount is a parameter that you may 
	% wish to experiment with, trying different integer values.
	dilatedImage = imdilate(binaryImage2, ones(dilationAmount));

	figure;  % Create another, new figure window.
	set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
	% Display the results of this step.
	subplot(2, 2, 1);
	imshow(dilatedImage, []);
	title('Dilation of one wall', 'FontSize', fontSize);

	filledImage = imfill(dilatedImage, 'holes');
	% Display the results of this step.
	subplot(2, 2, 2);
	imshow(filledImage, []);
	title('Now filled to get rid of holes', 'FontSize', fontSize);

	% Erode by the same amount of pixels
	erodedImage = imerode(filledImage, ones(dilationAmount));
	% Display the results of this step.
	subplot(2, 2, 3);
	imshow(erodedImage, []);
	title('Eroded', 'FontSize', fontSize);

	% Set the eroded part to zero to find the difference.
	% (You could also subtract the eroded from the filled, dilated image.
	solution = filledImage;
	solution(erodedImage) = 0;
	% Display the results of this step.
	subplot(2, 2, 4);
	imshow(solution, []);
	title('The Difference = The Solution', 'FontSize', fontSize);

	% Put the solution in red on top of the original image
	if numberOfColorBands == 1
		% If we're monochrome, we need to make the color planes.
		% If we're color, we already have these from above.
		redPlane = monoImage;
		greenPlane = monoImage;
		bluePlane = monoImage;
	end
	redPlane(solution) = 255;
	greenPlane(solution) = 0;
	bluePlane(solution) = 0;
	solvedImage = cat(3, redPlane, greenPlane, bluePlane);
	% Display the results of this step.
	figure;  % Create another, new figure window.
	imshow(solvedImage);
	set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
	title('Final Solution Over Original Image', 'FontSize', fontSize);
	
% 	Ask if they want to solve another maze.
	promptMessage = sprintf('Do you want to solve another maze?');
	button = questdlg(promptMessage, 'maze_solution', 'Yes', 'No', 'No');
	if strcmpi(button, 'No')
		continueWithAnother = false;
	end
end


