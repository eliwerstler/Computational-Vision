function displayImage(image, border)
% displayImage(image, border)
% short-cut function for invoking imtool on an image with the range of values 
% contained within a central region that excludes a border around the outer 
% edge of the image
[minV maxV] = getRange(image, border);
imtool(image, [minV maxV])