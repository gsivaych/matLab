% Program to generate a rectangular pulse of given amplitude, start and end points
clc; clear all;

% INPUT : amplitude , start & width 
A = input('Amplitude : ');
to = input('Start time : ');
T = input('End time : ');

to = to+T/2;
x = to-T:0.001:2*T;
f = zeros(size(x));
f(x >= to-T/2 & x <= to+T/2) = A;

figure('Name','Rectangular Pulse','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,f,'b'),grid on, grid minor
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

y = linspace(to-T,2*T,10);
fn = zeros(size(y));
fn(y >= to-T/2 & y <= to+T/2) = A;

subplot(2,1,2);
stem(y,fn,'r'),grid on, grid minor
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')