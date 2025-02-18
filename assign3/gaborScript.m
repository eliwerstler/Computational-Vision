sinImage = makeSin(10, 128);
showPColor(sinImage);
figure
gaussian = makeGaussian(128, 3);
showPColor(gaussian);
figure
gaborFilter = sinImage .* gaussian;
showPColor(gaborFilter);