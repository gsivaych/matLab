% Program to generate a rectangular pulse with given amplitude, start and end points
clc; clear all;

% INPUT : amplitude , start & width 
A = input('Amplitude : ');
to = input('Start time : ');
T = input('End time : ');

% continuous is just sampled faster
x = to-10:0.001:T+10;
f = zeros(size(x));
f(x >= to & x <= T) = A;

figure('Name','Rectangular Pulse','NumberTitle','off','Color','w')
subplot(2,1,1);
plot(x,f,'b'),grid on, grid minor
title('Continuous')
xlabel('Time')
ylabel('Amplitude')

y = to-10:0.5:T+10; % sampled after each 0.5 sec.
fn = zeros(size(y));
fn(y >= to & y <= T) = A;

subplot(2,1,2);
stem(y,fn,'r'),grid on, grid minor
title('Discrete')
xlabel('Time')
ylabel('Amplitude')

print('-clipboard','-dbitmap')