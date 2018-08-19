% Program to generate signal of unit ramp function
clc; clear all;

% UNIT RAMP FUNCTION - (slope 1, starting at 0)
%   R[x] = x    x >= 0
%        = 0    x < 0
% OR    R[x] = max { x , 0 }

x = -5:0.001:5;
f = x;
f(x < 0) = 0;

figure('Name','Unit Ramp','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,f,'b'),grid on, grid minor
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

y = -5:5;
fn = [0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5];

subplot(2,1,2);
stem(y,fn,'r'),grid on, grid minor
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')

% << + >>
% R[x] = ( x + abs(x) ) / 2
% R[x] = xH[x] : unit step multiplied by a straight line with unity gradient
% R[x] = H[x]*H[x] : convolution of unit step with itself
% R[x] = minus-infinity to x integral of unit step
% R[x] = <x> : Macaulay brackets