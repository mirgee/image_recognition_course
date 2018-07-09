
function [ retVal ] = dilatation( img, structElem )

img = double( img > 0 );
structElem = double( structElem > 0 );
retVal = double( conv2( img, structElem, 'same' ) > 0 );




end