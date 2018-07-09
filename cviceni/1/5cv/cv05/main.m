clear all;
close all;
clc


% % label returns image with 0 as background and i in i-th element
% img = imread( 'input/obr2.pgm' );
% img = double( img ) / 255;
% % 
% circle = kruh( 5, 12 );
% square = ones( 10, 10 );
% threshholdedImg = double( img < 0.25 );
% % 
% figure
% subplot( 2, 2, 1 );
% imshow( img );
% title( 'original image' );
% subplot( 2, 2, 2 );
% imshow( threshholdedImg );
% title( 'threshholded' );
% subplot( 2, 2, 3 );
% [ resImg, num ] = label( double( erosion( threshholdedImg, square ) ) );
% imshow( resImg );
% title( sprintf( 'eroded by square,\nnumber of circles: %d', num ) );
% subplot( 2, 2, 4 );
% [ resImg, num ] = label( double( erosion( threshholdedImg, circle ) ) );
% imshow( resImg );
% title( sprintf( 'eroded by circle,\nnumber of circles: %d', num ) );


%img = imread( 'input/obr3.pgm' );
%img = double( img ) / 255;
%img = double( img ~= 0 );
%circle = kruh( 5, 11 );
%% 
%figure
%subplot( 2, 1, 1 );
%imshow( img );
%title( 'original image' );
%subplot( 2, 1, 2 );
%imshow( dilatation( erosion( img, circle ), circle ) );
%title( 'opening of image' );


% img = imread( 'input/obr4.pgm' );
% img = double( img ) / 255;
% img = double( img ~= 0 );
% % 
% figure
% subplot( 2, 2, 1 );
% imshow( img );
% title( 'original image' );
% subplot( 2, 2, 2 );
% structElem = ones( 1, 20 );
% imshow( dilatation( erosion(img, structElem ), structElem ) );
% title( 'horizontal lines only' );
% subplot( 2, 2, 3 );
% structElem = ones( 20, 1 );
% imshow( dilatation( erosion(img, structElem ), structElem ) );
% title( 'vertical lines only' );
% subplot( 2, 2, 4 );
% structElem = eye( 15, 15 );
% imshow( dilatation( erosion(img, structElem ), structElem ) );
% title( 'top-left to bottom-right lines only' );


% img = imread( 'input/obr5.pgm' );
% img = double( img ) / 255;
% img = double( img ~= 0 );
% % 
% figure
% subplot( 2, 2, 1 );
% imshow( img );
% title( 'original image' );
% subplot( 2, 2, 2 );
% structElem = kruh( 10, 21 );
% imshow( erosion( dilatation( img, structElem ), structElem ) );
% title( 'closing of image, (10, 21)' );
% subplot( 2, 2, 3 );
% structElem = kruh( 5, 11 );
% imshow( erosion( dilatation( img, structElem ), structElem ) );
% title( 'closing of image, (5, 11)' );
% subplot( 2, 2, 4 );
% structElem = kruh( 20, 41 );
% imshow( erosion( dilatation( img, structElem ), structElem ) );
% title( 'closing of image, (20, 41)' );


 img = imread( 'input/noty.pgm' );
 img = double( img ) / 255;
 origImg = img;
 img = double( img < 0.9 );
 %
 structElem = ones( 1, 20 );
 horizontalLines = dilatation( erosion(img, structElem ), structElem );
 structElem = ones( 20, 1 );
 verticalLines = dilatation( erosion(img, structElem ), structElem );
 imgWithoutLines = max( img - horizontalLines - verticalLines, 0 );
 % structElem = [
 %                0 1 0 ; ...
 %                1 1 1 ; ...
 %                0 1 0   ...
 %              ];
 imgWithoutTrash = dilatation(dilatation( erosion( imgWithoutLines, ones( 5, 5 ) ), ...
                               ones( 5, 5 ) ), ones(5,5));
 % 
% figure
% numOfPlots = 4;
% subplot( numOfPlots, 1, 1 );
% imshow( origImg );
% title( 'original image' );
% subplot( numOfPlots, 1, 2 );
% imshow( img );
% title( 'threshholded' );
% subplot( numOfPlots, 1, 3 );
% imshow( imgWithoutLines );
% title( 'image without lines' );
% subplot( numOfPlots, 1, 4 );
% imshow( imgWithoutTrash );
% title( 'image without trash' );
%
% figure
% imshow( horizontalLines );
% title( 'staff' ); % staff == notova osnova

 figure
 i = imgWithoutTrash
 i = i(:,90:end)
 i= bwmorph(i, 'shrink', Inf)
 imshow( i );
 [x, y] = find(i==1)
% 

 
 %j = 1
% while j < size(i,2)
%    for l=1:size(i,1)
%      if i(l,j) > 0
%        printf("%i, %i\n", l+5, j+5)
%        j = j+20;
%        break
%      end
%    end
%    j = j+1;
%end















