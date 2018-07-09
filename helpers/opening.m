function retVal =  opening( img, structElem )

retVal = dilation ( erosion ( img, structElem), structElem )

end