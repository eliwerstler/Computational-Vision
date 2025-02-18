lap4 = laplacian(4);
chapelLeft = imread('chapelLeft.jpg');
chapelRight = imread('chapelRight.jpg');
chapLeftConv = conv2D(chapelLeft, lap4);
chapRightConv = conv2D(chapelRight, lap4);
zcChapLeft = stereoZeros(chapLeftConv);
zcChapRight = stereoZeros(chapRightConv);
dMap = stereoMatch(zcChapLeft, zcChapRight, 10, 6);
imshow(dMap, [-6 6]);
