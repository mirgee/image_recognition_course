function retVal =  closing( img, structElem )

retVal = erosion ( dilation ( img, structElem), structElem )

end