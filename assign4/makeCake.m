function dmap = makeCake (step)
% dmap = makeCake(step)
% creates a 200x200 matrix with a disparity pattern that consists
% of concentric circles of four different disparities (0, step,
% 2*step and 3*step)
dmap = zeros(200,200);
for i = 1:100
    for j = 1:100
        dist = sqrt((i-100)^2 + (j-100)^2);
        % select disparity based on distance from center
        if (dist < 20)
            val = 3*step;
        elseif (dist < 50)
            val = 2*step;
        elseif (dist < 80)
            val = step;
        else
            val = 0;
        end
        % note the symmetry of the disparity pattern
        dmap(i,j) = val;
        dmap(200-i,j) = val;
        dmap(i,200-j) = val;
        dmap(200-i,200-j) = val;
    end
end