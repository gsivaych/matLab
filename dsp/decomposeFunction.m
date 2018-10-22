% Program to decompose given function into its even and odd components
clc; clear all;

% Given Function :
%   x[n] = (0.8)^n

n = -10:0.0001:10; % Domain, Sampled 0.0001 apart
func = @(n) 0.8.^n ; % Function def.

even = (func(n)+func(-n))/2; % Even parts of function

odd =  (func(n)-func(-n))/2; % Odd parts of function

figure('Name','Decomposing a Function','NumberTitle','off','Color','w')
subplot(2,2,1)
plot(n,even,'b'), grid on, grid minor % continuous line 2D plot
title('Even part')
xlabel('Amplitude')
ylabel('Time')

subplot(2,2,2)
plot(n,odd,'b'), grid on, grid minor
title('Odd part')
xlabel('Amplitude')
ylabel('Time')


nr = -10:10; % Domain, Sampled 1 apart

evenr = (func(nr)+func(-nr))/2; % Even parts of function

oddr =  (func(nr)-func(-nr))/2; % Odd parts of function

subplot(2,2,3)
stem(nr,evenr,'r'), grid on, grid minor % discrete data 2D plot
title('Even part')
xlabel('Amplitude')
ylabel('Time')

subplot(2,2,4)
stem(nr,oddr,'r'), grid on, grid minor
title('Odd part')
xlabel('Amplitude')
ylabel('Time')

print('-clipboard','-dbitmap')