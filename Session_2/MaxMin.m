clc; clear; close all;

f = @(x) x.^3 - 3*x; 
df = @(x) 3*x.^2 - 3;
ddf = @(x) 6*x;

x = linspace(-3,3,500);

h1 = plot(x, f(x),  'm', 'LineWidth', 2);
hold on
h2 = plot(x, df(x), 'r', 'LineWidth', 2);
h3 = plot(x, ddf(x),'g', 'LineWidth', 2);

yline(0,'k','LineWidth',1.5)

% Highlight the x-axis (y = 0)
yline(0, 'w', 'LineWidth', 1.5);

xlabel('x')
ylabel('Value')
title('Function and Its Derivatives')
legend([h1 h2 h3], 'f(x)', 'f''(x)', 'f''''(x)')
grid on

zeros = roots([3 0 -3]);
plot(zeros, f(zeros),'ro', 'MarkerSize', 10)

curvature = ddf(zeros);