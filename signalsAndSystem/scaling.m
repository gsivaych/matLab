%   Program to generate signal of u(2t+1) , r(3t-1) and sine(2t)
clc, clear all;

t = -10:0.001:10;

% Unit fn.
u = zeros(size(t));
u (t>-0.5) = 1; % 2t+1 = 0 : t = -0.5

% Ramp fn.
r = 3*t-1;

% Sine fn.
s = sin(2*t);

figure('Name','Scaling','NumberTitle','off','Color','w')
subplot(3,1,1)
plot(t,u,'b'), grid on, grid minor
title('u(2t+1)')
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,2)
plot(t,r,'b'), grid on, grid minor
title('r(3t-1)')
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,3)
plot(t,s,'b'), grid on, grid minor
title('sine(2t)')
xlabel('Time')
ylabel('Amplitude')