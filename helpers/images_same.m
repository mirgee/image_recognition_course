function [comparison] = checkImage(pic1,pic2)
   img1 = imread(pic1);
   img2 = imread(pic2);

   img1Rows = size(img1, 1);        
   img1Cols = size(img1, 2);
   img2Rows = size(img2, 1);
   img2Cols = size(img2, 2);

   if (img1Rows ~= img2Rows) || (img1Cols ~= img2Cols)
       comparison = 'Image dimensions are not the same';
       return;
   end

   img1_double = double(img1);
   img2_double = double(img2);
   if sum( abs( img1_double(:) - img2_double(:) ) ) == 0.0
       comparison = 'The images are the same';
       return;
   end

   out = (img1(:,:,1) == img2(:,:,1)) & (img1(:,:,2) == img2(:,:,2)) & (img1(:,:,3) == img2(:,:,3));

   % // OR
   %out = true(size(img1,1), size(img1,2));
   %for p = 1 : 3
   %    img1_plane = img1(:,:,p);
   %    img2_plane = img2(:,:,p);
   %    out = out & (img1_plane == img2_plane);
   %end
   out = 255*uint8(cat(3,out,out,out));
   picture = [pic1(1:end-4) '_vs_' pic2(1:end-4) '.png'];
   imwrite(out, picture);
   comparison = sprintf('The RGB values are different: see %s.',picture);
