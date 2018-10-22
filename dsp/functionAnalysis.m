% Program to plot Real,Imaginary parts and absolute, phase values of function
clc; clear all;

% Given function
%   y(n) = exp(j*pi*n/8) , n <- [0,32]

n = 0:32; % Domain
func = @(n) exp(j*pi*n/8); % Function Definition
x = func(n); % Function Implementation

% Extracting real parts.
x1 = real(x);
figure('Name','Function analysis','NumberTitle','off','Color','w')
subplot(2,2,1) % Create axes in tiled positions
stem(n,x1), grid on, grid minor % Discrete data 2D plot
title('Real Part')
xlabel('Amplitude')
ylabel('Time')

% Extracting imaginary parts
x2 = imag(x);
subplot(2,2,2)
stem(n,x2), grid on, grid minor
title('Imaginary Part')
xlabel('Amplitude')
ylabel('Time')

% Absolute value
x3 = abs(x);
subplot(2,2,3)
stem(n,x3), grid on, grid minor
title('Absolute Value')
xlabel('Amplitude')
ylabel('Time')

% Phase angle in radians
x4 = angle(x);
subplot(2,2,4)
stem(n,x4), grid on, grid minor
title('Phase Value : Radians')
xlabel('Amplitude')
ylabel('Time')

print('-clipboard','-dbitmap')