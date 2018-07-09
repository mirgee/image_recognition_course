
function [ retVal ] = erosion( img, structElem )

img = double( img > 0 );
structElem = double( structElem > 0 );

retVal = double( filter2( structElem, 1 - img, 'same' ) == 0 );
% or ...
% retVal = double( filter2( structElem, img, 'same' ) ...
%                   == nnz( structElem ) );



end