function sinImage = makeSin( freq, size )
%makeSin creates a sinewave image of the given size in pixels
%   and frequency (cycles per image)
A = linspace(0, 2*pi, size);
B = sin(freq*A);
for i = 1:size
    sinImage(i, :) = B;
end

end

