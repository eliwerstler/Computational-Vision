sinImage = makeSin(10, 128);
showPcolor(sinImage);
gaussian = makeGaussian(128, 3);
showPColor(gaussian);
gaborFilter = sinImage .* gaussian;
showPColor(gaborFilter);
verticalGabor = gaborFilter';
showPColor(verticalGabor);