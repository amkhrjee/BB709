clc;
clear;
close all;

time = [0 12 24 36 48 60 72];
cells = [1200 1650 2450 3800 5600 7300 8100];

plot(time, cells, '-o')

xlabel('Time (hours)')
ylabel('Cell Count')
title('Cell Population Growth')
grid on

% Using the diff() function
cellDifference = diff(cells);
timeDifference = diff(time);
growthRate = cellDifference ./ timeDifference;

timeMid = (time(1:end-1) + time(2:end)) / 2;
plot(timeMid, growthRate, '-o')
xlabel('Time (hours)')
ylabel('Growth Rate (cells/hour)')
title('Estimated Growth Rate Using diff()')

% Using the gradient() function
growthRate = gradient(cells, time);

plot(time, growthRate, '-o')

xlabel('Time (hours)')
ylabel('Growth Rate (cells/hour)')
title('Estimated Cell Population Growth Rate')

% Finding max growth rate
[maxGrowthRate, idx] = max(growthRate);

fprintf('Maximum growth rate: %.2f cells/hour\n', maxGrowthRate);
fprintf('Observed at %.0f hours.\n', time(idx));
