clear; % Removes all variables
clc; % Clears the command window
close all; % Closes all windows with figures

% Storing data into variables

time = [0 1 2 3 4 5 6];
od = [0.05 0.08 0.12 0.22 0.41 0.78 1.20];

% Plotting the data

%     x     y  style
%     |     |   |
plot(time, od, '-o')

xlabel('Time (hours)')
ylabel('OD600')
title('Bacterial Growth Curve')
grid on

% Basic stats
averageOD = mean(od);
maximumOD = max(od);

% Printing text
fprintf('Average OD600: %.2f\n', averageOD);
fprintf('Maximum OD600: %.2f\n', maximumOD);