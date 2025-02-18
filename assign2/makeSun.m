function sun = makeSun
% sun = makeSun
% creates a 320x320 image of the sun illusion
sun = uint8(255*ones(320,320));
for i = 1:320
    for j = 1:320
        x = i-160;
        y = j-160;
        dist2 = x^2 + y^2;
        if ((dist2 > 900.0) && (dist2 < 10000.0) && ...
                ((i == 160) || (j == 160) || (x == y) || (x == -y) || ...
                (abs(y+0.414*x) < 0.5) || (abs(y-0.414*x) < 0.5) || ...
                (abs(y+2.414*x) < 1.2) || (abs(y-2.414*x) < 1.2)))
            sun(i,j) = 10;
        end
    end
end