function showStereogram (left,right)
% showStereogram(left,right)
% displays the left and right halves of a stereogram in a
% single figure window
figure, subplot(1,2,1), imshow(left), title('left image');
subplot(1,2,2), imshow(right), title('right image');