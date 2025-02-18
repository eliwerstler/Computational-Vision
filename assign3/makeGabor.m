% Eli Werstler
% CSCI 363
% Assignment 3
function gabor = makeGabor(size, freq, sigma)
    sinImage = makeSin(freq, size);
    gaussian = makeGaussian(size, sigma);
    gabor = sinImage .* gaussian;
end

% Discussion Log: I worked alone on this project.