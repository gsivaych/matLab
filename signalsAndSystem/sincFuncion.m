% Program to generate signal of Sinc function
clc; clear all;

%   sinc(x) = 1             for x = 0
%           = sin(x)/x      otherwise

x = -20:0.001:20; % domain
y = sin(x);
y = y./x;
y (x == 0) = 1;

figure('Name','Sinc','NumberTitle','off','Color','w')
subplot(2,1,1)
plot(x,y,'b'),grid on, grid minor
title('Continuous Sinc fn.')
xlabel('Time')
ylabel('Amplitude')

xs = -20:0.5:20; % sampled after 0.5 sec each
ys = sin(xs);
ys = ys./xs;
ys ( xs == 0) = 1;

subplot(2,1,2)
stem(xs,ys,'r'),grid on, grid minor
title('Discrete Sinc fn.')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')