% Program to generate signal of ramp function
clc; clear all;

% RAMP FUNCTION - (slope 1, passes through origin [f(x) = x])
%   R[x] = x

x = -5:0.001:5;
f = x;

figure('Name','Ramp','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,f,'b'),grid on, grid minor
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

y = -5:5;
fn = y;

subplot(2,1,2);
stem(y,fn,'r'),grid on, grid minor
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')