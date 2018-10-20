% Program to generate signal of 
%   r(t-3) [unit ramp function delayed 3 sec.] : right shift
%   u(t+2) [unit step function advanced 2 sec.] : left shift
clc; clear all;

t = -10:0.0001:10; % domain for analysis
r = t-3; % delay 3 sec.
r (r <= 0) = 0;

u = zeros(size(t));
u (t+2 > 0) = 1; % came in advance, 2 sec.

figure('Name','Time Shifting','NumberTitle','Off','Color','w')
subplot(2,1,1)
plot(t,r,'r'), grid on, grid minor
title('Unit Ramp function delayed 3 sec. : Right shift')
xlabel('Time')
ylabel('Amplitude')

subplot(2,1,2)
plot(t,u,'g'), grid on, grid minor
title('Unit Step function advanced 2 sec. : Left Shift')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')