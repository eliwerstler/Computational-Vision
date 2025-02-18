function newImage = overlayZC(image, zcMap)
% newImage = overlayZC(image, zcMap)
% given an input 2D 8-bit image and a 2D 8-bit matrix of the locations of 
% zero-crossings, creates and returns a 2D 8-bit image of the same size, with 
% white zero-crossing contours obtained from the input zcMap superimposed on 
% a low-contrast version of the original image 
newImage = uint8(0.75*double(image));
newImage(zcMap == 255) = 255;