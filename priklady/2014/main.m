I = imread('scan.jpg');
I = rgb2gray(I);
I = I < 80;
%imshow(I);

I = imerode(I, ones(2,2));
I = imdilate(I, kruh(15,30));
I = imclose(I, kruh(25,50));

%imshow(I);

b = myboundary(I);

imshow(b);

R = primkySnimku(b,5);

imshow(imrotate(b, R(1)-180));

%[y x] = find( bw ); % note that find returns row-col coordinates.
%
%mx = mean(x);
%my = mean(y);
%C = [ mean( (x-mx).^2 ),     mean( (x-mx).*(y-my) );...  
%      mean( (x-mx).*(y-my) ) mean( (y-my).^2 ) ];
%[V D] = eig( C );
%
%quiver( mx([1 1]), my([1 1]), (V(1,:)*D), (V(2,:)*D), .05 );
%[~,mxi] = max(diag(D)); % find major axis index: largest eigen-value
%or = atan2( V(2,mxi), V(1,mxi) ) * 180/pi ; % convert to degrees for readability
%rotate = imrotate( im2, or-180 );