% Eli Werstler
% CSCI 363
% Assignment 6

function movieFrames = ske(npts)
% creates a movie of the stereokinetic effect
% vectors of coordinates for outer white frame
xc0 = [-120 120 120 -120 -120];
yc0 = [-120 -120 120 120 -120];
% vectors of center coordinates of inner circles over time
[xc1 yc1] = circlePoints(0,0,15,50);
[xc2 yc2] = circlePoints(0,0,25,50);
[xc3 yc3] = circlePoints(0,0,40,50);
[xc4 yc4] = circlePoints(0,0,50,50);
[xc5 yc5] = circlePoints(0,0,40,50);
[xc6 yc6] = circlePoints(0,0,30,50);
[xc7 yc7] = circlePoints(0,0,20,50);
figure, axis off
for frame = 1:50
    fill(xc0, yc0, 'w');       % display white background
    hold on
    axis equal
    axis off
    [xc yc] = circlePoints(0,0,100,npts);   % large outer circle
    fill(xc, yc, 'b', 'EdgeColor', 'b');
    % rotate and display each inner circle, filled in with color
    [xc yc] = circlePoints(xc1(frame),yc1(frame),85,npts);
    fill(xc, yc, 'y', 'EdgeColor', 'y');
    [xc yc] = circlePoints(xc2(frame),yc2(frame),75,npts);
    fill(xc, yc, 'b', 'EdgeColor', 'b');
    [xc yc] = circlePoints(xc3(frame),yc3(frame),60,npts);
    fill(xc, yc, 'y', 'EdgeColor', 'y');
    [xc yc] = circlePoints(xc4(frame),yc4(frame),50,npts);
    fill(xc, yc, 'b', 'EdgeColor', 'b');
    [xc yc] = circlePoints(xc5(frame),yc5(frame),40,npts);
    fill(xc, yc, 'y', 'EdgeColor', 'y');
    [xc yc] = circlePoints(xc6(frame),yc6(frame),30,npts);
    fill(xc, yc, 'b', 'EdgeColor', 'b');
    [xc yc] = circlePoints(xc7(frame),yc7(frame),20,npts);
    fill(xc, yc, 'y', 'EdgeColor', 'y');
    movieFrames(frame) = getframe;	   % create movie frame
    hold off
end
