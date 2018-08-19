% Program to generate signal of unit step function / heaviside step function
clc; clear all;

% UNIT STEP FUNCTION - (zero for -ve argument & 1 for +ve argument)
%   H[n] = 0    n < 0
%        = 1    n >= 0
% or using half maximum convention
%   H[n] = 0    n < 0
%   H[n] = 1/2  n = 0
%   H[n] = 1    n > 0

x = -5:0.001:5; % Domain, Data Points 0.001 apart
f = zeros(size(x)); % Array of same size initialized with zeros
f(x==0) = 0.5;  % Conditional value assignment
f(x>0) = 1;

figure('Name','Unit Step','NumberTitle','off','Color','w')
subplot(2,1,1); % Create axes in tiled positions
plot(x,f,'b'),grid on, grid minor % Continuous line 2D plot
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

y = -5:5; % Domain, Data Points 1 apart
fn = zeros(size(y));
fn(y==0) = 0.5;
fn(y>0) = 1;

subplot(2,1,2);
stem(y,fn,'r'),grid on, grid minor % Discrete data 2D plot
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap') % Copy figure to clipboard : on Linux

% << + >>
% The simplest definition of the Heaviside function is as the derivative of the ramp function
%   H[x] = d/dx max{x,0}
% The Heaviside function can also be defined as the integral of
% The Dirac Delta function / unit impulse function
%   H[x] = integration minus-infinity to x delta(s) ds