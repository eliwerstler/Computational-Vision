function final_net = coopStereo(left, right, minD, maxD, iters)
% final_net = coopStereo(left, right, minD, maxD, iters)
% implements the Marr-Poggio cooperative stereo algorithm. The left and
% right input images should contain a stereogram. minD and maxD are the
% minimum and maximum disparities in the stereogram. The input iters
% specifies the number of iterations to run.
dRange = maxD - minD + 1;       % total number of distinct disparities
[vdim hdim] = size(left);

% Set up two 3-D arrays (net1 and net2) with the first two dimensions the same size as the left image 
% and a 3rd dimension the size of the disparity range (maxD - minD + 1)
% to store network
% Initialize their contents to zero.

hlim = hdim-dRange;
vlim = vdim - 2;
net1 = zeros(hdim, vdim, dRange);
net2 = zeros(hdim, vdim, dRange);
% Write a nested for loop to step through all the horizontal and vertical positions and 
% all the disparities to set up the initial values of net1.
% At each disparity value, the value for a given position is 1 if
% the value at left(i, j) is the same as the value at right(i, j+disp)
% Leave 2 rows of zeros at the top and bottom of net1, and dRange zeros on the 
% left and right edges of net1.
for i = 2:vlim
    for j = dRange:hlim
        for disp = minD:maxD
            index = disp-minD+1;
            if left(i,j) == right(i,j + disp)
                net1(i,j,index) = 1;
            end
        end
    end
end

init_net = net1;                % save and display initial state
figure, showDispPlanes(255*init_net);
epsilon = 2.0;                  % arbitrary constants used for updating
threshold = 3.0;                    % the state of the network
for iter = 1:iters              % perform specified number of iterations
    for i = 3:vlim
        for j = dRange:hlim
            for d = 1:dRange
                % compute positive support by adding the values of neighbors at the same disparity
                pos = sum(sum(net1(i-1:i+1, j-1:j+1, d)));
                pos = pos + net1(i-2,j,d);
                pos = pos + net1(i+2,j,d);
                pos = pos + net1(i,j-2,d);
                pos = pos + net1(i,j+2,d);
                pos = pos - net1(i,j,d);
                % compute the negative support by adding together all other possible matches
                neg = 0;
                for disp = 1:dRange
                    neg = neg + net1(i,j,disp);
                    neg = neg + net1(i,j+d-disp,disp);
                end
                val = (2 * net1(i,j,d));
                neg = neg - val;
                % Test to see if the support is greater than the threshold and set corresponding net2 value 
                % to 1 if it is and zero if it is not.  Support is computed as 
                % the current value in net1, plus the positive support minus epsilon times the negative
                % support
                sup = net1(i,j,d) + pos - (epsilon * neg);
                if (sup > threshold)
                    net2(i,j,d) = 1;
                else
                    net2(i,j,d) = 0;
                end
            end
        end
    end
    net1 = net2;                % reset net1 to new state of network
    figure, showDispPlanes(255*net1);   % display new state of network
end
final_net = net2;       % return final state of network
