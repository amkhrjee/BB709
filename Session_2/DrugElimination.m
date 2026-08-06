clc;
clear;
close all;

C0 = 80;
t = linspace(0, 12, 100);
C = C0*exp(-0.25*t);
plot(t, C)
xlabel("Time (hours)")
ylabel("Drug concentration (mg/L)")

C_prime = -0.25*C0*exp(-0.25*t);
plot(t, C_prime)
xlabel("Time (hours)")
ylabel('dC/dt (mg/L/hour)')