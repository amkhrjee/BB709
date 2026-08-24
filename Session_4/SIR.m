clc; clear; close all;

% Given parameters
N = 1000;
gamma = 0.20;
R_0 = 3.0;

% We can get beta
beta = (R_0 * gamma) / N;

% Initial conditions
%      S   I   R
%      |   |   |
x0 = [990; 10; 0];

% We want to observe for 100 days
tspan = [0 100];

% The function that outputs the differentials
function dxdt = SIR_ODE(x, beta, gamma)
    S = x(1); % Takes the first element
    I = x(2); % Takes the second element
    
    dSdt = -beta*S*I;
    dIdt = beta*S*I - gamma*I;
    dRdt = gamma*I;
    
    dxdt = [dSdt; dIdt; dRdt]; % Outputs everything together!
end

% Calculating the differentials
%         Anonymous function
%              |
%              |     that calls the ODE function defined earlier
%              |            |
[t, x] = ode45(@(t, x) SIR_ODE(x, beta, gamma), tspan, x0);

S = x(:, 1);
I = x(:, 2);
R = x(:, 3);

plot(t, S, "LineWidth", 2)
hold on
plot(t, I, "LineWidth", 2)
plot(t, R, "LineWidth", 2)
xlabel("Time (days)")
ylabel("Number of people")

[Imax,k] = max(I);
tpeak = t(k);
xline(tpeak, "--")
legend("Susceptible", "Infected", "Recovered", "Infection peak")



