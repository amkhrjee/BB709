clc; clear; close all;

f = @(x) cos(x);

% Take 1000 points between -π to π
x = linspace(-pi, pi,1000);

plot(x,f(x),'k','LineWidth',2)
hold on

% Our goal will be to approximate *around* x = 0
xline(0,'--r')
grid on
hold on

% First approximation
yline(1, '-b', 'LineWidth', 2)

% Second approximation
T2 = @ (x) - x.^2 / 2;
plot (x, 1 + T2(x), 'g', 'LineWidth', 2)

% Third approximation
T3 = @ (x) x.^4 / 24;
plot (x, 1 + T2(x) + T3(x), 'r', 'LineWidth', 2)