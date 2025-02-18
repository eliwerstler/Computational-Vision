% Eli Werstler
% CSCI 363
% Assignment 2
function zcSlope = zeros2D(conv)
[x,y] = size(conv);
zcSlope = uint8(zeros(x,y));
for i = 2:x-1
    for j = 2:y-1
        dx = conv(i,j) - conv(i-1,j);
        dy = conv(i,j) - conv(i,j-1);
        slope = round(sqrt((dx*dx) + (dy*dy)));
        if ((conv(i,j) * conv(i-1,j)) < 0) || ((conv(i,j) * conv(i,j-1)) < 0)
            zcSlope(i,j) = slope;
        end
    end
end
end