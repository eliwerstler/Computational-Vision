function showNetwork(network)
% showNetwork(network)
% displays a state of the 3-D network for the cooperative stereo
% algorithm as a gray-level image, where each location shows the
% average of the disparities active (equal to 1) at that location
[vdim hdim disp] = size(network);
image = zeros(vdim,hdim);
for v = 1:vdim
    for h = 1:hdim
        num = 0;
        sum = 0;
        for d = 1:disp
            if (network(v,h,d) == 1)
                num = num+1;
                sum = sum+d;
            end
        end
        if (num > 0)
            image(v,h) = sum/num;
        end
    end
end
figure, imshow(image, [0 disp]), title('state of network');
