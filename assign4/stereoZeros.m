function stereoZC = stereoZeros (conv)
% stereoZC = stereoZeros(conv)
% computes the zero-crossings of the input convolution that are
% detected in the horizontal direction and stores them in the
% resulting stereoZC matrix. Positive zero-crossings are indicated
% by the value 1 and negative zero-crossings by -1
[xdim ydim] = size(conv);
stereoZC = zeros(xdim, ydim);
for x = 2:xdim
    for y = 2:ydim
        if (conv(x,y)*conv(x,y-1) < 0)
            if (conv(x,y) > 0)
                stereoZC(x,y) = 1;
            else
                stereoZC(x,y) = -1;
            end
        end
    end
end