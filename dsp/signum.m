% Program to generate signal of signum function
clc; clear all;

% SIGNUM FUNCTION - (extracts sign of real number)
%   sgn(x) = -1     x < 0
%          =  0     x = 0
%          =  1     x > 0

x = -5:5;
f = zeros(size(x));
f(x > 0) = 1;
f(x < 0) = -1;

figure('Name','Signum Function','NumberTitle','off','Color','w')
stem(x,f,'r'),grid on, grid minor
title('Signum Function : Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')
