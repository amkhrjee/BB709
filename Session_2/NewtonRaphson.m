clc; clear; close all;

f = @(x) x.^2 - 4;
df = @(x) 2*x;

x = linspace(-4,4,500);

plot(x,f(x),'LineWidth',2)
hold on

yline(0,'k--')

xlabel('x')
ylabel('f(x)')
hold on

% First estimate
root_estimate = 3;

plot(root_estimate, 0, 'ro')

% Improving the estimate with Newton-Raphson
root_estimate = root_estimate - f(root_estimate)/df(root_estimate);
plot(root_estimate, 0, 'bo')