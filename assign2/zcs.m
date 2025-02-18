% Eli Werstler
% CSCI 363
% Assignment 2
function zcImage = zcs(conv)
[x,y] = size(conv);
zcImage = zeros(x,y);
for i = 2:x
    for j = 2:y
        if ((conv(i,j) * conv(i-1,j)) < 0) || ((conv(i,j) * conv(i,j-1)) < 0)
            zcImage(i,j) = 255;
        end
    end
end
end